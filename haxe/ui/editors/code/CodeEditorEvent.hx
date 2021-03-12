package haxe.ui.editors.code;

import haxe.ui.events.UIEvent;

class CodeEditorEvent extends UIEvent {
    public static inline var POSITION_CHANGE:String = "positionChange";
    
    public function new(type:String, bubble:Null<Bool> = false, data:Dynamic = null) {
        super(type, bubble, data);
    }
}