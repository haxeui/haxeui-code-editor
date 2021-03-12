package haxe.ui.editors.code.scintilla;

typedef RegExpSection = {
    @:optional var id:String;
    @:optional var restrictToWords:Bool;
    @:optional var rules:Array<RegExpRule>;
}

typedef RegExpRule = {
    var rule:String;
    var regexp:EReg;
}

class RegExpLanguage {
    public var sections:Array<RegExpSection> = [];
    
    public function new() {
    }
    
    public function getSection(id:String):RegExpSection {
        for (s in sections) {
            if (s.id == id) {
                return s;
            }
        }
        return null;
    }
    
    public function getSections(exclude:Array<String> = null):Array<RegExpSection> {
        var r = [];
        
        for (s in sections) {
            if (exclude != null && exclude.contains(s.id) == false) {
                r.push(s);
            } else if (exclude == null) {
                r.push(s);
            }
        }
        
        return r;
    }
}