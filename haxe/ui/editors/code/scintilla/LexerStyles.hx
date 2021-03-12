package haxe.ui.editors.code.scintilla;

import hx.widgets.styles.LexicalStates;

typedef LexerStyleInfo = {
    var id:String;
    var tags:Map<String, Array<Int>>;
}

class LexerStyles {
    private static var _instance:Map<String, Map<Int, Int>>;
    public static var instance(get, null):Map<String, Map<Int, Int>>;
    private static function get_instance():Map<String, Map<Int, Int>> {
        if (_instance == null) {
            _instance = [
                "cpp" => [
                    LexicalStates.C_DEFAULT                     => 0xFF00FF,// x
                    LexicalStates.C_COMMENT                     => 0x008000, // x
                    LexicalStates.C_COMMENTLINE                 => 0x008000, // x
                    LexicalStates.C_COMMENTDOC                  => 0x008000, // x
                    LexicalStates.C_NUMBER                      => 0x09885A,// x
                    LexicalStates.C_WORD                        => 0xFF00FF,// x
                    LexicalStates.C_STRING                      => 0xA31515,// x
                    LexicalStates.C_CHARACTER                   => 0xA31515,// x
                    LexicalStates.C_UUID                        => 0xFF0000,
                    LexicalStates.C_PREPROCESSOR                => 0x0000FF,// x
                    LexicalStates.C_OPERATOR                    => 0x000000,// x
                    LexicalStates.C_IDENTIFIER                  => 0x000000,// x
                    LexicalStates.C_STRINGEOL                   => 0xFF0000,// x
                    LexicalStates.C_VERBATIM                    => 0xFF0000,
                    LexicalStates.C_REGEX                       => 0xFF0000,
                    LexicalStates.C_COMMENTLINEDOC              => 0x008000, // x
                    LexicalStates.C_WORD2                       => 0xFF00FF,
                    LexicalStates.C_COMMENTDOCKEYWORD           => 0x008000, // x
                    LexicalStates.C_COMMENTDOCKEYWORDERROR      => 0x008000, // x
                    LexicalStates.C_GLOBALCLASS                 => 0xFF00FF,
                    LexicalStates.C_STRINGRAW                   => 0xFF00FF,// x
                    LexicalStates.C_TRIPLEVERBATIM              => 0xFF0000,// x
                    LexicalStates.C_HASHQUOTEDSTRING            => 0xFF0000,// x
                    LexicalStates.C_PREPROCESSORCOMMENT         => 0x008000, // x
                    LexicalStates.C_PREPROCESSORCOMMENTDOC      => 0x008000, // x
                    LexicalStates.C_USERLITERAL                 => 0xFF0000,
                    LexicalStates.C_TASKMARKER                  => 0xFF0000,
                    LexicalStates.C_ESCAPESEQUENCE              => 0xFF0000
                ],
                
                "xml" => [
                    LexicalStates.H_DEFAULT                     => 0x000000,// x
                    LexicalStates.H_TAG                         => 0xA31515,// x
                    LexicalStates.H_TAGUNKNOWN                  => 0xA31515,// x
                    LexicalStates.H_ATTRIBUTE                   => 0xFF0000,// x
                    LexicalStates.H_ATTRIBUTEUNKNOWN            => 0xFF0000,// x
                    LexicalStates.H_NUMBER                      => 0x0000FF,// x
                    LexicalStates.H_DOUBLESTRING                => 0x0000FF,// x
                    LexicalStates.H_SINGLESTRING                => 0x0000FF,// x
                    LexicalStates.H_OTHER                       => 0x0000FF,
                    LexicalStates.H_COMMENT                     => 0x008000,// x
                    LexicalStates.H_ENTITY                      => 0x0000FF,
                    LexicalStates.H_TAGEND                      => 0x0000FF,// x
                    LexicalStates.H_XMLSTART                    => 0x0000FF,// x
                    LexicalStates.H_XMLEND                      => 0x0000FF,// x
                    LexicalStates.H_CDATA                       => 0xFF0000
                ]
            ];
        }
        
        return _instance;
    }
    
    private var _styleInfo:Map<String, LexerStyleInfo> = new Map<String, LexerStyleInfo>();
    
    public function new() {
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