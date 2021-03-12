package haxe.ui.editors.code.scintilla;

import haxe.ui.editors.code.languages.Languages;
import haxe.ui.editors.code.scintilla.RegExpLanguage.RegExpSection;

class LanguageParser {
    private static var _cache:Map<String, RegExpLanguage> = new Map<String, RegExpLanguage>();
    public static function get(id:String):RegExpLanguage {
        if (_cache.exists(id)) {
            return _cache.get(id);
        }
        
        var lang = Languages.instance.getLangauge(id);
        if (lang == null) {
            return null;
        }
        
        var rexpLang = new RegExpLanguage();
        for (s in lang.sections) {
            if (s.id == "comment.start" || s.id == "comment.end") {
                continue;
            }
            var rexpSection:RegExpSection = {
                id: s.id,
                restrictToWords: s.restrictToWords,
                rules: []
            };
            rexpLang.sections.push(rexpSection);
            for (r in s.rules) {
                r = fixRegExp(r);
                if (s.id == "keywords") {
                    r = "^" + r + "$";
                } else if (s.id == "strings") {
                    r = r + ".*" + r;
                } else if (s.id == "numbers") {
                    r = "^" + r + "$";
                }
                rexpSection.rules.push({
                    rule: r,
                    regexp: new EReg(r, "gm")
                });
            }
        }
     
        //            \\/\\*.*?\\*\\/
        //            \\/\\*.*?\\*/
        //            \\/\\*
        //                     \\*/
        var start = lang.findRules("comment.start")[0];
        var end = lang.findRules("comment.end")[0];
        if (start != null && end != null) {
            var rexpSection = rexpLang.getSection("comment");
            if (rexpSection == null) {
                rexpSection = {
                    id: "comment",
                    rules: []
                };
                rexpLang.sections.push(rexpSection);
            }
            var r = start + ".*?" + end;
            rexpSection.rules.push({
                rule: r,
                regexp: new EReg(r, "gsm")
            });
        }
        
        _cache.set(id, rexpLang);
        
        return rexpLang;
    }
    
    private static function fixRegExp(s):String {
        if (s == "?") {
            s = "\\?";
        } else if (s == "++") {
            s = "\\+\\+";
        } else if (s == "+") {
            s = "\\+";
        } else if (s == "*") {
            s = "\\*";
        } else if (s == "+=") {
            s = "\\+=";
        } else if (s == "*=") {
            s = "\\*=";
        } else if (s == "|") {
            s = "\\|";
        } else if (s == "||") {
            s = "\\|\\|";
        } else if (s == "|=") {
            s = "\\|=";
        } else if (s == "...") {
            s = "\\.\\.\\.";
        } else if (s == "^") {
            s = "\\^";
        } else if (s == "[A-Z][\\w\\$]*") { // full on hack
            s = "^[A-Z][\\w\\$]*";
        }
        return s;
    }
}