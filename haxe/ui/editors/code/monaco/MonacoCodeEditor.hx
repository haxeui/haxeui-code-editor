package haxe.ui.editors.code.monaco;

import haxe.ui.core.Component;
import haxe.ui.core.InteractiveComponent;
import haxe.ui.events.UIEvent;
import monaco.Editor.IStandaloneCodeEditor;
import monaco.Languages.IMonarchLanguage;

class MonacoCodeEditor extends InteractiveComponent {
    private static var loader:MonacoLoader = new MonacoLoader();
    
    private var _editor:IStandaloneCodeEditor;
    
    public function new() {
        super();
        addClass("code-editor");
    }

    private var _text:String;
    private override function get_text():String {
        if (_editor != null) {
            return _editor.getValue();
        }
        return _text;
    }
    private override function set_text(value:String):String {
        //super.set_text(value);
        _text = value;
        _text = StringTools.replace(_text, "\\n", "\n");
        _text = StringTools.replace(_text, "\\t", "    ");
        if (_editor != null) {
            _editor.setValue(_text);
        }
        return value;
    }
    
    public override function onReady() {
        super.onReady();
        
        loader.register(onMonacoReady);
    }
    
    private function onMonacoReady() {
        addLanguage(_language);
        _editor = Monaco.editor.create(this.element, {
            renderLineHighlight: "none",
            language: _language,
            fontSize: 12
        });
        _editor.setValue(_text);
        if (_focus == true) {
            _editor.focus();
        }

        _editor.getModel().onDidChangeContent(function(e) {
            dispatch(new UIEvent(UIEvent.CHANGE));
        });
        _editor.onDidChangeCursorPosition(function(e) {
            dispatch(new UIEvent(UIEvent.CHANGE));
        });
        invalidateComponent();
    }

    private var _language:String;
    public var language(get, set):String;
    private function get_language() {
        return _language;
    }
    private function set_language(value:String):String {
        _language = value;
        if (_editor != null) {
            addLanguage(value);
            Monaco.editor.setModelLanguage(_editor.getModel(), _language);
        }
        return value;
    }
    
    private function addLanguage(id) {
        if (hasLanguage(id) == false) {
            var lang = LanguageParser.get(id);
            if (lang != null) {
                Monaco.languages.register( { id: id } );
                Monaco.languages.setMonarchTokensProvider(id, lang);
            }
        }
    }
    
    public function hasLanguage(id:String):Bool {
        for (l in Monaco.languages.getLanguages()) {
            if (l.id == id) {
                return true;
            }
        }
        return false;
    }
    
    public override function validateComponentLayout():Bool {
        var b = super.validateComponentLayout();
        if (this.width > 0 && this.height > 0 && _editor != null) {
            var usableSize = this.layout.usableSize;
            _editor.layout({
               width: usableSize.width,
               height: usableSize.height
            });
        }
        return b;
    }
    
    private override function set_focus(value:Bool):Bool {
        _focus = value;
        if (_editor != null && _focus == true) {
            Toolkit.callLater(function() {
                _editor.focus();
            });
        }
        return value;
    }
    
    public var caretPosition(get, set):Position;
    private function get_caretPosition():Position {
        var modelPos = _editor.getPosition();
        return new Position(modelPos.lineNumber, modelPos.column);
    }
    private function set_caretPosition(value:Position):Position {
        _editor.setPosition({
            readonly: false,
            lineNumber: value.line,
            column: value.column
        }); 
        return value;
    }
}
