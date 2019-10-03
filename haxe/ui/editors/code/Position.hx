package haxe.ui.editors.code;

class Position {
    public var line:Float;
    public var column:Float;
    
    public function new(line:Float = 0, column:Float = 0) {
        this.line = line;
        this.column = column;
    }
}