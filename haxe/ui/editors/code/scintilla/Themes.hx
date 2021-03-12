package haxe.ui.editors.code.scintilla;

class Themes {
    private static var _instance:Themes;
    public static var instance(get, null):Themes;
    private static function get_instance():Themes {
        if (_instance == null) {
            _instance = new Themes();
        }
        return _instance;
    }

    //****************************************************************************************************
    // Instance
    //****************************************************************************************************
    private var _themes:Map<String, Theme> = new Map<String, Theme>();
    
    private function new() {
        registerDefaults();
    }
    
    private function registerDefaults() {
        registerThemeFromResource("default", "haxeui-code-editor/themes/scintilla/default.json");
        registerThemeFromResource("dark", "haxeui-code-editor/themes/scintilla/dark.json");
    }
    
    public function registerTheme(themeId:String, theme:Theme) {
        _themes.set(themeId, theme);
    }
    
    public function getTheme(themeId:String):Theme {
        return _themes.get(themeId);
    }
    
    public function registerThemeFromResource(themeId:String, resourceId:String) {
        var jsonString = Resource.getString(resourceId);
        if (jsonString != null) {
            var theme = Theme.fromJson(jsonString);
            registerTheme(themeId, theme);
        }
    }
}