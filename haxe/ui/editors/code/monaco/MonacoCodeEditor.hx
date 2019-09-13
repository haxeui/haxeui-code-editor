package haxe.ui.editors.code.monaco;

import haxe.ui.core.Component;
import monaco.Editor.IStandaloneCodeEditor;

class MonacoCodeEditor extends Component {
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
        trace("ready!");
        _editor = Monaco.editor.create(this.element, {
            renderLineHighlight: "none",
            language: _language
        });
        _editor.setValue(_text);
        
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
            Monaco.editor.setModelLanguage(_editor.getModel(), _language);
        }
        return value;
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
}
