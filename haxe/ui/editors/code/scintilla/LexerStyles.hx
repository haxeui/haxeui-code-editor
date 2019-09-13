package haxe.ui.editors.code.scintilla;

import hx.widgets.styles.LexicalStates;

class LexerStyles {
    private static var _instance:Map<String, Map<Int, Int>>;
    public static var instance(get, null):Map<String, Map<Int, Int>>;
    private static function get_instance():Map<String, Map<Int, Int>> {
        if (_instance == null) {
            _instance = [
                "cpp" => [
                    LexicalStates.C_DEFAULT                     => 0xFF00FF,
                    LexicalStates.C_COMMENT                     => 0x008000,
                    LexicalStates.C_COMMENTLINE                 => 0x008000,
                    LexicalStates.C_COMMENTDOC                  => 0x008000,
                    LexicalStates.C_NUMBER                      => 0x09885A,
                    LexicalStates.C_WORD                        => 0xFF00FF,
                    LexicalStates.C_STRING                      => 0xA31515,
                    LexicalStates.C_CHARACTER                   => 0xA31515,
                    LexicalStates.C_UUID                        => 0xFF0000,
                    LexicalStates.C_PREPROCESSOR                => 0x0000FF,
                    LexicalStates.C_OPERATOR                    => 0x000000,
                    LexicalStates.C_IDENTIFIER                  => 0x000000,
                    LexicalStates.C_STRINGEOL                   => 0xFF0000,
                    LexicalStates.C_VERBATIM                    => 0xFF0000,
                    LexicalStates.C_REGEX                       => 0xFF0000,
                    LexicalStates.C_COMMENTLINEDOC              => 0x008000,
                    LexicalStates.C_WORD2                       => 0xFF00FF,
                    LexicalStates.C_COMMENTDOCKEYWORD           => 0x008000,
                    LexicalStates.C_COMMENTDOCKEYWORDERROR      => 0x008000,
                    LexicalStates.C_GLOBALCLASS                 => 0xFF00FF,
                    LexicalStates.C_STRINGRAW                   => 0xFF00FF,
                    LexicalStates.C_TRIPLEVERBATIM              => 0xFF0000,
                    LexicalStates.C_HASHQUOTEDSTRING            => 0xFF0000,
                    LexicalStates.C_PREPROCESSORCOMMENT         => 0x008000,
                    LexicalStates.C_PREPROCESSORCOMMENTDOC      => 0x008000,
                    LexicalStates.C_USERLITERAL                 => 0xFF0000,
                    LexicalStates.C_TASKMARKER                  => 0xFF0000,
                    LexicalStates.C_ESCAPESEQUENCE              => 0xFF0000
                ],
                
                "xml" => [
                    LexicalStates.H_DEFAULT                     => 0x000000,
                    LexicalStates.H_TAG                         => 0xA31515,
                    LexicalStates.H_TAGUNKNOWN                  => 0xA31515,
                    LexicalStates.H_ATTRIBUTE                   => 0xFF0000,
                    LexicalStates.H_ATTRIBUTEUNKNOWN            => 0xFF0000,
                    LexicalStates.H_NUMBER                      => 0x0000FF,
                    LexicalStates.H_DOUBLESTRING                => 0x0000FF,
                    LexicalStates.H_SINGLESTRING                => 0x0000FF,
                    LexicalStates.H_OTHER                       => 0x0000FF,
                    LexicalStates.H_COMMENT                     => 0x008000,
                    LexicalStates.H_ENTITY                      => 0x0000FF,
                    LexicalStates.H_TAGEND                      => 0x0000FF,
                    LexicalStates.H_XMLSTART                    => 0x0000FF,
                    LexicalStates.H_XMLEND                      => 0x0000FF,
                    LexicalStates.H_CDATA                       => 0xFF0000
                ]
            ];
        }
        
        return _instance;
    }
    
    public function new() {
    }
}