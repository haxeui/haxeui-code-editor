package haxe.ui.editors.code.monaco;

import js.Browser;

class MonacoLoader {
    private static var _loaded:Bool = false;
    private static var _loading:Bool = false;
    private static var _callbacks:Array<Void->Void> = [];
    
    private var _version:String = null;
    
    public function new(version:String = "0.17.0") {
        _version = version;
    }
    
    public function register(fn:Void->Void) {
        if (_loaded == false) {
            _callbacks.push(fn);
            if (_loading == false) {
                _loading = true;
                
                var scriptElement = Browser.document.createScriptElement();
                scriptElement.onload = function(e) {
                    Require.config( { paths: { 'vs': 'monaco-editor-${_version}/min/vs' }} );
                    Require.require(['vs/editor/editor.main'], function() {
                        _loaded = true;
                        
                        for (f in _callbacks) {
                            if (f != null) {
                                f();
                            }
                        }
                    });
                }
                scriptElement.src = 'monaco-editor-${_version}/min/vs/loader.js';
                Browser.document.body.appendChild(scriptElement);
            }
        } else {
            fn();
        }
    }
    
}
