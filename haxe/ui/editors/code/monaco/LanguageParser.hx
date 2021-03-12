package haxe.ui.editors.code.monaco;

import haxe.ui.editors.code.languages.Languages;

class LanguageParser {
    public static function get(id:String):Dynamic {
        var config:Dynamic = {
			// we include these common regular expressions
			symbols: new js.lib.RegExp('[=><!~?:&|+\\-*\\/\\^%]+'),
			// C# style strings
			escapes: new js.lib.RegExp('\\\\(?:[abfnrtv\\\\"\']|x[0-9A-Fa-f]{1,4}|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8})'),
            tokenizer: {
            }
        }
        
        var lang = Languages.instance.getLangauge(id);
        if (lang == null) {
            return null;
        }
        
        config.keywords = lang.findRules("keywords");
        config.typeKeywords = lang.findRules("types");
        config.operators = lang.findRules("operators");

        var root:Array<Dynamic> = [];
        root.push([new js.lib.RegExp('[a-z_$][\\w$]*'), { cases: { '@typeKeywords': 'keyword', '@keywords': 'keyword', '@default': 'identifier' }}]);
        root.push({ include: '@whitespace' });
        for (r in lang.findRules("types")) {
            root.push([new js.lib.RegExp(r), 'type.identifier']);
        }
        for (r in lang.findRules("brackets")) {
            root.push([new js.lib.RegExp(r), '@brackets']);
        }
        for (r in lang.findRules("annotations")) {
            root.push([new js.lib.RegExp(r), 'annotation']);
        }
        for (r in lang.findRules("numbers.float")) {
            root.push([new js.lib.RegExp(r), 'number.float']);
        }
        for (r in lang.findRules("numbers.hex")) {
            root.push([new js.lib.RegExp(r), 'number.hex']);
        }
        for (r in lang.findRules("numbers")) {
            root.push([new js.lib.RegExp(r), 'number']);
        }
        for (r in lang.findRules("delimiters")) {
            root.push([new js.lib.RegExp(r), 'delimiter']);
        }
        for (r in lang.findRules("strings")) {
            root.push([new js.lib.RegExp(r), 'string', '@string.' + r ]);
        }

        config.tokenizer.root = root;

        config.tokenizer.comment = [
            [new js.lib.RegExp('[^' + lang.findRules("comment.start")[0] + ']+'), 'comment' ],
            [new js.lib.RegExp("" + lang.findRules("comment.end")[0]), 'comment', '@pop' ],
        ];
        
        var string:Array<Dynamic> = [];
        string.push([new js.lib.RegExp('[^\\\\' + lang.concatRules("strings") + ']+'), 'string']);
        string.push([new js.lib.RegExp('@escapes'), 'string.escape']);
        string.push([new js.lib.RegExp('\\\\.'), 'string.escape.invalid']);
        for (r in lang.findRules("strings")) {
            string.push([new js.lib.RegExp('[' + r + ']'), { cases: { '$#==$S2' : { token: 'string', next: '@pop' }, '@default': 'string' }} ]);
        }
        config.tokenizer.string = string;

        config.tokenizer.whitespace = [
            [new js.lib.RegExp('[ \\t\\r\\n]+'), 'white'],
            [new js.lib.RegExp('' + lang.findRules("comment.start")[0]), 'comment', '@comment' ],
            [new js.lib.RegExp('' + lang.findRules("comment")[0]), 'comment'],
        ];

        return config;
    }
}