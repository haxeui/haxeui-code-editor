package haxe.ui.editors.code.scintilla;

typedef ThemeDefaults = {
    @:optional var foreground:Null<Int>;
    @:optional var background:Null<Int>;
    @:optional var caret:Null<Int>;
    @:optional var selection:Null<Int>;
}

typedef ThemeFormat = {
    @:optional var foreground:Null<Int>;
    @:optional var background:Null<Int>;
    @:optional var index:Int;
    @:optional var tags:Array<String>;
}

class Theme {
    public var formats:Array<ThemeFormat> = [];
    public var defaults:ThemeDefaults = {};
    
    public function new() {
    }
    
    public function loadFromJson(jsonString:String) {
        formats = [];
        
        var json = Json.parse(jsonString);
        
        if (json.defaults != null) {
            defaults = {};
            if (json.defaults.foreground != null) {
                defaults.foreground = parseColor(json.defaults.foreground);
            }
            if (json.defaults.background != null) {
                defaults.background = parseColor(json.defaults.background);
            }
            if (json.defaults.caret != null) {
                defaults.caret = parseColor(json.defaults.caret);
            }
            if (json.defaults.selection != null) {
                defaults.selection = parseColor(json.defaults.selection);
            }
        } else {
            defaults = {};
        }
        
        var jsonFormats:Array<Dynamic> = json.formats;
        var n = 0;
        for (jsonFormat in jsonFormats) {
            var format:ThemeFormat = {
                tags: []
            }
            
            if (jsonFormat.foreground != null) {
                format.foreground = parseColor(jsonFormat.foreground);
            }
            if (jsonFormat.background != null) {
                format.background = parseColor(jsonFormat.background);
            }
            if (jsonFormat.tags != null) {
                format.tags =jsonFormat.tags;
            }
            format.index = n;
            formats.push(format);
            n++;
        }
    }
    
    public function findFormatByTag(tag:String):ThemeFormat {
        for (f in formats) {
            if (f.tags.contains(tag)) {
                return f;
            }
        }
        return null;
    }
    
    private static function parseColor(v:String):Int {
        if (StringTools.startsWith(v, "#")) {
            v = "0x" + v.substr(1);
        }
        
        return Std.parseInt(v);
    }
    
    public static function fromJson(jsonString:String):Theme {
        var t = new Theme();
        t.loadFromJson(jsonString);
        return t;
    }
}