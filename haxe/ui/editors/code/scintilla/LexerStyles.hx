package haxe.ui.editors.code.scintilla;

import hx.widgets.styles.LexicalStates;

typedef LexerStyleInfo = {
    var id:String;
    var tags:Map<String, Array<Int>>;
}

class LexerStyles {
    private var _styleInfo:Map<String, LexerStyleInfo> = new Map<String, LexerStyleInfo>();
    
    private static var _instance:LexerStyles;
    public static var instance(get, null):LexerStyles;
    private static function get_instance():LexerStyles {
        if (_instance == null) {
            _instance = new LexerStyles();
        }
        return _instance;
    }
    
    private function new() {
        addLexerStyleInfo({
            id: "cpp",
            tags: [
                "keywords" => [LexicalStates.C_PREPROCESSOR, LexicalStates.C_GLOBALCLASS],
                "comment" => [LexicalStates.C_COMMENT, LexicalStates.C_COMMENTLINE, LexicalStates.C_COMMENTDOC, LexicalStates.C_PREPROCESSORCOMMENT, LexicalStates.C_PREPROCESSORCOMMENTDOC, LexicalStates.C_COMMENTDOCKEYWORD, LexicalStates.C_COMMENTDOCKEYWORDERROR, LexicalStates.C_COMMENTLINEDOC],
                "strings" => [LexicalStates.C_STRING, LexicalStates.C_CHARACTER, LexicalStates.C_STRINGEOL, LexicalStates.C_TRIPLEVERBATIM, LexicalStates.C_HASHQUOTEDSTRING, LexicalStates.C_STRINGRAW, LexicalStates.C_WORD],
                "default" => [LexicalStates.C_OPERATOR, LexicalStates.C_IDENTIFIER, LexicalStates.C_DEFAULT],
                "numbers" => [LexicalStates.C_NUMBER]
            ]
        });
        addLexerStyleInfo({
            id: "xml",
            tags: [
                "keywords" => [LexicalStates.H_TAG, LexicalStates.H_TAGUNKNOWN, LexicalStates.H_XMLSTART, LexicalStates.H_XMLEND, LexicalStates.H_TAGEND],
                "types" =>  [LexicalStates.H_ATTRIBUTE, LexicalStates.H_ATTRIBUTEUNKNOWN, LexicalStates.H_ENTITY],
                "comment" => [LexicalStates.H_COMMENT],
                "strings" => [LexicalStates.H_DOUBLESTRING, LexicalStates.H_SINGLESTRING, LexicalStates.H_CDATA],
                "default" => [LexicalStates.H_DEFAULT],
                "numbers" => [LexicalStates.H_NUMBER]
                
            ]
        });
    }
    
    public function addLexerStyleInfo(info:LexerStyleInfo) {
        _styleInfo.set(info.id, info);
    }
    
    public function hasStyles(lexer:String):Bool {
        return _styleInfo.exists(lexer);
    }
    
    public function themeStyles(lexer:String, theme:Theme):Map<Int, Int> {
        var info = _styleInfo.get(lexer);
        if (info == null) {
            return null;
        }

        var styles:Map<Int, Int> = new Map<Int, Int>();
        
        var defaultStates = info.tags.get("default");
        if (defaultStates != null) {
            var themeDefaults = theme.defaults;
            if (themeDefaults != null) {
                for (state in defaultStates) {
                    styles.set(state, themeDefaults.foreground);
                }
            }
        }
        
        for (tag in info.tags.keys()) {
            var format = theme.findFormatByTag(tag);
            if (format == null) {
                continue;
            }
            var states = info.tags.get(tag);
            for (state in states) {
                styles.set(state, format.foreground);
            }
        }
        return styles;
    }
}