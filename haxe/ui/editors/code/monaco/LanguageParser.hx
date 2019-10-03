package haxe.ui.editors.code.monaco;

class LanguageParser {
    public function new() {
    }
    
    public static function get(id:String):Dynamic {
        var lang:Dynamic = {
			// we include these common regular expressions
			symbols: new js.RegExp('[=><!~?:&|+\\-*\\/\\^%]+'),
			// C# style strings
			escapes: new js.RegExp('\\\\(?:[abfnrtv\\\\"\']|x[0-9A-Fa-f]{1,4}|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8})'),
            tokenizer: {
            }
        }
        
        var data = Resource.getString("haxeui-code-editor/languages/" + id + "/language.json");
        if (data == null) {
            return null;
        }
        var json = Json.parse(data);
        lang.keywords = json.keywords;
        lang.typeKeywords = json.typeKeywords;
        lang.operators = json.operators;
        
        lang.tokenizer.root = [
            // identifiers and keywords
            [new js.RegExp('[a-z_$][\\w$]*'), { cases: { '@typeKeywords': 'keyword',
                '@keywords': 'keyword',
                '@default': 'identifier' } }],
            [new js.RegExp('[A-Z][\\w\\$]*'), 'type.identifier' ],  // to show class names nicely
            // whitespace
            { include: '@whitespace' },
            // delimiters and operators
            [new js.RegExp('[{}()\\[\\]]'), '@brackets'],
            [new js.RegExp('[<>](?!@symbols)'), '@brackets'],
            [new js.RegExp('@symbols'), { cases: { '@operators': 'operator',
                '@default'  : '' } } ],
            // @ annotations.
            // As an example, we emit a debugging log message on these tokens.
            // Note: message are supressed during the first load -- change some lines to see them.
            [new js.RegExp('@\\s*[a-zA-Z_\\$][\\w\\$]*'), { token: 'annotation', log: 'annotation token: $0' }],
            // numbers
            [new js.RegExp('\\d*\\.\\d+([eE][\\-+]?\\d+)?'), 'number.float'],
            [new js.RegExp('0[xX][0-9a-fA-F]+'), 'number.hex'],
            [new js.RegExp('\\d+'), 'number'],
            // delimiter: after number because of .\d floats
            [new js.RegExp('[;,.]'), 'delimiter'],
            // strings: recover on non-terminated strings
            [new js.RegExp('"([^"\\\\]|\\\\.)*$'), 'string.invalid' ],  // non-teminated string
            [new js.RegExp('\'([^\'\\\\]|\\\\.)*$'), 'string.invalid' ],  // non-teminated string
            [new js.RegExp('"'), 'string', '@string."' ],
            [new js.RegExp('\''), 'string', '@string.\'' ],
            // characters
            [new js.RegExp('[^\\\\\']\''), 'string'],
            [new js.RegExp('(\')(@escapes)(\')'), ['string','string.escape','string']],
            [new js.RegExp('\''), 'string.invalid']
        ];
        
        lang.tokenizer.comment = [
            [new js.RegExp('[^\\/*]+'), 'comment' ],
            // [/\/\*/, 'comment', '@push' ],    // nested comment not allowed :-(
            [new js.RegExp('\\/\\*'),    'comment.invalid' ],
            ["\\*/",    'comment', '@pop'  ],
            [new js.RegExp('[\\/*]'),   'comment' ]
        ];
                
        lang.tokenizer.string = [
            [new js.RegExp('[^\\\\"\']+'), 'string'],
            [new js.RegExp('@escapes'), 'string.escape'],
            [new js.RegExp('\\\\.'), 'string.escape.invalid'],
            [new js.RegExp('["\']'),     { cases: { '$#==$S2' : { token: 'string', next: '@pop' },
                '@default': 'string' }} ]
        ];
        
        lang.tokenizer.whitespace = [
            [new js.RegExp('[ \\t\\r\\n]+'), 'white'],
            [new js.RegExp('\\/\\*'),       'comment', '@comment' ],
            [new js.RegExp('\\/\\/.*$'),    'comment'],
        ];
        
        return lang;
    }
}