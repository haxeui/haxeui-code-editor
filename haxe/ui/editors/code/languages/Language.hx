package haxe.ui.editors.code.languages;
import haxe.Json;

typedef Section = {
    @:optional var id:String;
    @:optional var rules:Array<String>;
    @:optional var restrictToWords:Bool;
}

class Language {
    public var sections:Array<Section> = [];
    
    public function new() {
    }
    
    public function loadFromJson(jsonString:String) {
        sections = [];
        
        var json = Json.parse(jsonString);
        
        var jsonSections:Array<Dynamic> = json;
        for (jsonSection in jsonSections) {
            var section:Section = {
                id: jsonSection.id,
                rules: jsonSection.rules
            }
            if (jsonSection.restrictToWords != null) {
                section.restrictToWords = jsonSection.restrictToWords;
            }
            addSection(section);
        }
    }
    
    public function addSection(section:Section) {
        sections.push(section);
    }
    
    public function findSection(sectionId:String):Section {
        for (s in sections) {
            if (s.id == sectionId) {
                return s;
            }
        }
        return null;
    }
    
    public function findRules(sectionId:String):Array<String> {
        var s = findSection(sectionId);
        if (s == null) {
            return [];
        }
        
        if (s.rules == null) {
            return [];
        }
        
        return s.rules;
    }
    
    public function concatRules(sectionId:String):String {
        var r = findRules(sectionId);
        return r.join("");
    }
    
    public static function fromJson(jsonString:String):Language {
        var l = new Language();
        l.loadFromJson(jsonString);
        return l;
    }
}