package haxe.ui.editors.code;
import haxe.ui.Toolkit;

class CodeEditor extends CodeEditorImpl {
    public function new() {
        super();
    }
    
    @:event(CodeEditorEvent.POSITION_CHANGE)       public var onPositionChange:CodeEditorEvent->Void;
    
    private override function onThemeChanged() {
        super.onThemeChanged();
        this.theme = Toolkit.theme;
    }
}