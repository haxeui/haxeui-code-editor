package haxe.ui.editors.code.monaco;

@:native("require")
extern class Require {
    public static function config(config:Dynamic):Void;
    
    public static inline function require(modules:Array<String>, cb:Void->Void):Void {
        #if (haxe_ver >= 4.1)
        js.Syntax.code("require({0}, {1})", modules, cb);
        #else
        untyped __js__("require({0}, {1})", modules, cb);
        #end
    }
}