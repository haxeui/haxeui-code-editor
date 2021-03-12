package haxe.ui.editors.code;

class Position {
    public var line:Int;
    public var column:Int;
    public var position:Int;
    
    public function new(line:Int = 0, column:Int = 0, position:Int = 0) {
        this.line = line;
        this.column = column;
        this.position = position;
    }
}