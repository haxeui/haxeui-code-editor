package haxe.ui.editors.code.scintilla;

import haxe.ui.core.Component;
import hx.widgets.StyledTextCtrl;
import hx.widgets.styles.LexicalStates;

class ScintillaEditor extends Component {
    private var _textCtrl:StyledTextCtrl = null;
    
    public var readOnly:Bool;
    
    public function new() {
        super();
        addClass("code-editor");
    }
    
    public override function onReady() {
        super.onReady();
        
        _textCtrl = cast(this.window, StyledTextCtrl);
        _textCtrl.setMarginWidth(0, 32);
        applyLanguage();
        _textCtrl.text = _text;
        
    }
    
    private var _language:String;
    public var language(get, set):String;
    private function get_language() {
        return _language;
    }
    private function set_language(value:String):String {
        _language = value;
        applyLanguage();
        return value;
    }
    
    private function applyLanguage() {
        if (_textCtrl == null) {
            return;
        }
        _textCtrl.styleClearAll();
        var lexer = _language;
        _textCtrl.lexerLanguage = lexer;
        var styles = LexerStyles.instance.get(lexer);
        if (styles != null) {
            for (k in styles.keys()) {
                var v = styles.get(k);
                _textCtrl.styleSetForeground(k, v);
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
        _text = StringTools.replace(_text, "\\n", "\n");
        _text = StringTools.replace(_text, "\\t", "    ");
        if (_textCtrl != null) {
            _textCtrl.text = _text;
        }
        return value;
    }
}