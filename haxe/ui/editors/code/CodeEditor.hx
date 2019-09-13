package haxe.ui.editors.code;

#if haxeui_html5
    typedef CodeEditor = haxe.ui.editors.code.monaco.MonacoCodeEditor;
#elseif haxeui_hxwidgets
    typedef CodeEditor = haxe.ui.editors.code.scintilla.ScintillaEditor;
#else
    typedef CodeEditor = haxe.ui.components.TextArea;
#end
