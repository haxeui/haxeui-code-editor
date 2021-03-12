package haxe.ui.editors.code.scintilla;

import haxe.ui.core.Component;
import haxe.ui.editors.code.languages.Language;
import haxe.ui.editors.code.languages.Languages;
import haxe.ui.editors.code.scintilla.LexerStyles;
import haxe.ui.editors.code.scintilla.RegExpLanguage;
import haxe.ui.editors.code.scintilla.Theme;
import hx.widgets.StyledTextCtrlEventType;
import hx.widgets.StyledTextCtrl;
import hx.widgets.StyledTextCtrlLexer;
import hx.widgets.styles.LexicalStates;
import hx.widgets.styles.StyledTextControlStyle;

class ScintillaEditor extends Component {
    private var _textCtrl:StyledTextCtrl = null;
    
    public var readOnly:Bool;
    private var _fontName:String = "Consolas";
    private var _fontSize:Null<Int> = 9;
    
    public function new() {
        super();
        addClass("code-editor");
    }
    
    public override function onReady() {
        super.onReady();
        
        _textCtrl = cast(this.window, StyledTextCtrl);
        if (_lineNumbers == true) {
            _textCtrl.setMarginType(0, 1);
            _textCtrl.setMarginWidth(0, 32);
            _textCtrl.setMarginWidth(1, 16);
        }
        _textCtrl.text = _text;
        
        _textCtrl.bind(StyledTextCtrlEventType.UPDATEUI, onUpdateUI);
        
        if (_theme == null) {
            buildTheme(_themeName);
        }
        applyFormatting(_lang);
    }
    
    private function onUpdateUI(e) {
        applyTheme();
        if (_lang != null) {
            applyFormatting(_lang);
        }
        dispatch(new CodeEditorEvent(CodeEditorEvent.POSITION_CHANGE));
    }
    
    private var _currentLexer:String = "container";
    private var _lang:RegExpLanguage = null;
    private var _language:String;
    public var language(get, set):String;
    private function get_language() {
        return _language;
    }
    private function set_language(value:String):String {
        if (_language == value) {
            return value;
        }
        _language = value;
        
        if (LexerStyles.instance.hasStyles(_language)) {
            _lang = null;
            _currentLexer = _language;
            _textCtrl.lexerLanguage = _currentLexer;
            if (_theme == null) {
                buildTheme(_themeName);
            } else {
                applyTheme();
            }
        } else {
            var lang = LanguageParser.get(_language);
            _currentLexer = "container";
            if (_theme == null) {
                buildTheme(_themeName);
            } else {
                applyTheme();
            }
            
            if (lang != null) {
                _lang = lang;
                applyFormatting(_lang);
            }
        }
        return value;
    }
    
    private var _restrictToWords:EReg = new EReg("\\w+", "g");
    private function applyFormatting(lang:RegExpLanguage) {
        if (_textCtrl == null || lang == null) {
            return;
        }

        _textCtrl.lexer = StyledTextCtrlLexer.CONTAINER;
        _currentLexer = "container";
        var text = _textCtrl.text;

        applyThemeFormatting(text, "keywords");
        applyThemeFormatting(text, "types");
        applyThemeFormatting(text, "numbers");
        applyThemeFormatting(text, "numbers.float");
        applyThemeFormatting(text, "numbers.hex");
        applyThemeFormatting(text, "annotations");
        applyThemeFormatting(text, "comment");
        applyThemeFormatting(text, "strings");
    }
    
    private function applyThemeFormatting(text:String, section:String, pre:EReg = null) {
        var s = _lang.getSection(section);
        if (s == null) {
            return;
        }
        
        var te = _theme.findFormatByTag(section);
        if (te == null) {
            return;
        }
        
        if (s.restrictToWords) {
            pre = _restrictToWords;
        }
        
        applyFormattingSection(text, s, te.index + 1, pre);
    }
    
    private function applyFormattingSection(text:String, section:RegExpSection, style:Int, pre:EReg = null) {
        if (section == null) {
            return;
        }
        
        for (r in section.rules) {
            if (pre != null) {
                pre.map(text, function(sr) {
                    var pos = sr.matchedPos();
                    var sub = sr.matched(0);
                    if (r.regexp.match(sub)) {
                        _textCtrl.startStyling(pos.pos, 0);
                        _textCtrl.setStyling(pos.len, style);
                    }
                    return null;
                });
            } else {
                r.regexp.map(text, function(sr) {
                    var pos = sr.matchedPos();
                    _textCtrl.startStyling(pos.pos, 0);
                    _textCtrl.setStyling(pos.len, style);
                    
                    return null;
                });
            }
        }
    }
    
    private var _text:String;
    private override function get_text():String {
        if (_textCtrl != null) {
            return _textCtrl.text;
        }
        return _text;
    }
    private override function set_text(value:String):String {
        //super.set_text(value);
        _text = value;
        if (_textCtrl != null) {
            _textCtrl.text = _text;
        }
        applyFormatting(_lang);
        return value;
    }
    
    public var caretPosition(get, set):Position;
    private function get_caretPosition():Position {
        return new Position(_textCtrl.currentLine + 1, _textCtrl.currentColumn + 1, _textCtrl.currentPos);
    }
    private function set_caretPosition(value:Position):Position {
        return value;
    }
    
    private var _lineNumbers:Bool = true;
    public var lineNumbers(get, set):Bool;
    private function get_lineNumbers():Bool {
        return _lineNumbers;
    }
    private function set_lineNumbers(value:Bool):Bool {
        if (_lineNumbers == value) {
            return value;
        }
        _lineNumbers = value;
        if (_textCtrl != null) {
            if (_lineNumbers == true) {
                _textCtrl.setMarginWidth(0, 32);
                _textCtrl.setMarginWidth(1, 16);
            } else {
                _textCtrl.setMarginWidth(0, 0);
                _textCtrl.setMarginWidth(1, 0);
            }
        }
        return value;
    }
    
    private var _themeName:String = "default";
    public var theme(get, set):String;
    private function get_theme():String {
        return _themeName;
    }
    private function set_theme(value:String):String {
        if (value == _themeName) {
            return value;
        }
        _themeName = value;
        buildTheme(_themeName);
        return value;
    }
    
    private var _theme:Theme = null;
    private var _defaults:ThemeDefaults = null;
    private function buildTheme(themeName:String) {
        if (_textCtrl == null) {
            return;
        }
        var t = Themes.instance.getTheme(themeName);
        if (t == null) {
            return;
        }
        
        _theme = t;
        applyTheme();
    }
    
    private function applyTheme() {
        if (_textCtrl == null || _theme == null) {
            return;
        }
        
        _textCtrl.styleClearAll();
            _textCtrl.styleSetForeground(StyledTextControlStyle.LINENUMBER, 0xFF0000);
        applyThemeDefaults();
        
        if (_currentLexer == "container") {
            for (t in _theme.formats) {
                if (t.foreground != null) {
                    _textCtrl.styleSetForeground(t.index + 1, t.foreground);
                }
                if (t.background != null) {
                    _textCtrl.styleSetBackground(t.index + 1, t.background);
                }
                if (_fontSize != null) {
                    _textCtrl.styleSetSize(t.index + 1, _fontSize);
                }
                if (_fontName != null) {
                    _textCtrl.styleSetFaceName(t.index + 1, _fontName);
                }
            }
        } else {
            var styles = LexerStyles.instance.themeStyles(_currentLexer, _theme);
            
            //var styles = LexerStyles.instance.get(_currentLexer);
            if (styles != null) {
                for (k in styles.keys()) {
                    var v = styles.get(k);
                    _textCtrl.styleSetForeground(k, v);
                    if (_fontSize != null) {
                        _textCtrl.styleSetSize(k, _fontSize);
                    }
                    if (_fontName != null) {
                        _textCtrl.styleSetFaceName(k, _fontName);
                    }
                }
            }
        }
    }
    
    private function applyThemeDefaults() {
        if (_textCtrl == null || _theme == null) {
            return;
        }
        
        if (_theme.defaults != null && _theme.defaults != _defaults) {
            //_defaults = _theme.defaults;
            if (_theme.defaults.background != null) {
                _textCtrl.backgroundColour = _theme.defaults.background;
            }
            if (_theme.defaults.caret != null) {
                _textCtrl.caretForeground = _theme.defaults.caret;
            }
            if (_theme.defaults.selection != null) {
                _textCtrl.setSelBackground(true, _theme.defaults.selection);
            }
            if (_theme.defaults.foreground != null) {
                _textCtrl.styleSetForeground(0, _theme.defaults.foreground);
            }
            if (_fontSize != null) {
                _textCtrl.styleSetSize(0, _fontSize);
            }
            if (_fontName != null) {
                _textCtrl.styleSetFaceName(0, _fontName);
            }
        }
    }
}