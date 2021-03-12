package haxe.ui.editors.code;

#if haxeui_html5
    typedef CodeEditorImpl = haxe.ui.editors.code.monaco.MonacoCodeEditor;
#elseif haxeui_hxwidgets
    typedef CodeEditorImpl = haxe.ui.editors.code.scintilla.ScintillaEditor;
#else
    typedef CodeEditorImpl = haxe.ui.components.TextArea;
#end
