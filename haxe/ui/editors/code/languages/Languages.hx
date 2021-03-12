package haxe.ui.editors.code.languages;

class Languages {
    private static var _instance:Languages;
    public static var instance(get, null):Languages;
    private static function get_instance():Languages {
        if (_instance == null) {
            _instance = new Languages();
        }
        return _instance;
    }

    //****************************************************************************************************
    // Instance
    //****************************************************************************************************
    private var _languages:Map<String, Language> = new Map<String, Language>();
    
    private function new() {
        registerDefaults();
    }
    
    private function registerDefaults() {
        registerLanguageFromResource("haxe", "haxeui-code-editor/languages/haxe.json");
        registerLanguageFromResource("hxml", "haxeui-code-editor/languages/hxml.json");
    }
    
    public function registerLanguage(languageId:String, language:Language) {
        _languages.set(languageId, language);
    }
    
    public function getLangauge(languageId:String):Language {
        return _languages.get(languageId);
    }
    
    public function registerLanguageFromResource(languageId:String, resourceId:String) {
        var jsonString = Resource.getString(resourceId);
        if (jsonString != null) {
            var language = Language.fromJson(jsonString);
            registerLanguage(languageId, language);
        }
    }
}