package monaco;
import Monaco;
typedef IDiffNavigator = {
	function canNavigate():Bool;
	function next():Void;
	function previous():Void;
	function dispose():Void;
};
typedef IDiffNavigatorOptions = {
	var readonly : Dynamic;
	@:optional
	var followsCaret : Bool;
	@:optional
	var ignoreCharChanges : Bool;
	@:optional
	var alwaysRevealFirst : Bool;
};
typedef IStandaloneThemeData = {
	var base : Dynamic;//BuiltinTheme;
	var inherit : Bool;
	var rules : Array<ITokenThemeRule>;
	var colors : Dynamic;//IColors;
};
typedef ITokenThemeRule = {
	var token : String;
	@:optional
	var foreground : String;
	@:optional
	var background : String;
	@:optional
	var fontStyle : String;
};
typedef MonacoWebWorker<T> = {
	function dispose():Void;
	function getProxy():js.lib.Promise<T>;
	function withSyncedResources(resources:Array<Uri>):js.lib.Promise<T>;
};
typedef IWebWorkerOptions = {
	var moduleId : String;
	@:optional
	var createData : Dynamic;
	@:optional
	var label : String;
};
typedef IActionDescriptor = {
	var id : String;
	var label : String;
	@:optional
	var precondition : String;
	@:optional
	var keybindings : Array<Float>;
	@:optional
	var keybindingContext : String;
	@:optional
	var contextMenuGroupId : String;
	@:optional
	var contextMenuOrder : Float;
	function run(editor:ICodeEditor):Dynamic;//haxe.extern.EitherType<Void, Promise<Void>>;
};
typedef IEditorConstructionOptions = {
	>IEditorOptions,
	@:optional
	var model : ITextModel;
	@:optional
	var value : String;
	@:optional
	var language : String;
	@:optional
	var theme : String;
	@:optional
	var accessibilityHelpUrl : String;
};
typedef IDiffEditorConstructionOptions = {
	>IDiffEditorOptions,
	@:optional
	var theme : String;
};
typedef IStandaloneCodeEditor = {
	>ICodeEditor,
	function addCommand(keybinding:Float, handler:ICommandHandler, context:String):String;
	function createContextKey<T>(key:String, defaultValue:T):IContextKey<T>;
	function addAction(descriptor:IActionDescriptor):IDisposable;
};
typedef IStandaloneDiffEditor = {
	>IDiffEditor,
	function addCommand(keybinding:Float, handler:ICommandHandler, context:String):String;
	function createContextKey<T>(key:String, defaultValue:T):IContextKey<T>;
	function addAction(descriptor:IActionDescriptor):IDisposable;
	// function getOriginalEditor():IStandaloneCodeEditor;
	// function getModifiedEditor():IStandaloneCodeEditor;
};
typedef ICommandHandler = { };
typedef IContextKey<T> = {
	function set(value:T):Void;
	function reset():Void;
	function get():T;
};
typedef IEditorOverrideServices = { };
typedef IMarker = {
	var owner : String;
	var resource : Uri;
	var severity : MarkerSeverity;
	@:optional
	var code : String;
	var message : String;
	@:optional
	var source : String;
	var startLineNumber : Float;
	var startColumn : Float;
	var endLineNumber : Float;
	var endColumn : Float;
	@:optional
	var relatedInformation : Array<IRelatedInformation>;
};
typedef IMarkerData = {
	@:optional
	var code : String;
	var severity : MarkerSeverity;
	var message : String;
	@:optional
	var source : String;
	var startLineNumber : Float;
	var startColumn : Float;
	var endLineNumber : Float;
	var endColumn : Float;
	@:optional
	var relatedInformation : Array<IRelatedInformation>;
};
typedef IRelatedInformation = {
	var resource : Uri;
	var message : String;
	var startLineNumber : Float;
	var startColumn : Float;
	var endLineNumber : Float;
	var endColumn : Float;
};
typedef IColorizerOptions = {
	@:optional
	var tabSize : Float;
};
typedef IColorizerElementOptions = {
	>IColorizerOptions,
	@:optional
	var theme : String;
	@:optional
	var mimeType : String;
};
@:enum abstract ScrollbarVisibility(Int) {
	var Auto = 1;
	var Hidden = 2;
	var Visible = 3;
}
typedef ThemeColor = {
	var id : String;
};
@:enum abstract OverviewRulerLane(Int) {
	var Left = 1;
	var Center = 2;
	var Right = 4;
	var Full = 7;
}
typedef IModelDecorationOverviewRulerOptions = {
	var color : haxe.extern.EitherType<String, ThemeColor>;
	var darkColor : haxe.extern.EitherType<String, ThemeColor>;
	@:optional
	var hcColor : haxe.extern.EitherType<String, ThemeColor>;
	var position : OverviewRulerLane;
};
typedef IModelDecorationOptions = {
	@:optional
	var stickiness : TrackedRangeStickiness;
	@:optional
	var className : String;
	@:optional
	var glyphMarginHoverMessage : haxe.extern.EitherType<IMarkdownString, Array<IMarkdownString>>;
	@:optional
	var hoverMessage : haxe.extern.EitherType<IMarkdownString, Array<IMarkdownString>>;
	@:optional
	var isWholeLine : Bool;
	@:optional
	var zIndex : Float;
	@:optional
	var overviewRuler : IModelDecorationOverviewRulerOptions;
	@:optional
	var glyphMarginClassName : String;
	@:optional
	var linesDecorationsClassName : String;
	@:optional
	var marginClassName : String;
	@:optional
	var inlineClassName : String;
	@:optional
	var inlineClassNameAffectsLetterSpacing : Bool;
	@:optional
	var beforeContentClassName : String;
	@:optional
	var afterContentClassName : String;
};
typedef IModelDeltaDecoration = {
	var range : IRange;
	var options : IModelDecorationOptions;
};
typedef IModelDecoration = {
	var readonly : Dynamic;
	var id : String;
	var ownerId : Float;
	var range : Range;
	var options : IModelDecorationOptions;
};
typedef IWordAtPosition = {
	var readonly : Dynamic;
	var word : String;
	var startColumn : Float;
	var endColumn : Float;
};
@:enum abstract EndOfLinePreference(Int) {
	var TextDefined = 0;
	var LF = 1;
	var CRLF = 2;
}
@:enum abstract DefaultEndOfLine(Int) {
	var LF = 1;
	var CRLF = 2;
}
@:enum abstract EndOfLineSequence(Int) {
	var LF = 0;
	var CRLF = 1;
}
typedef ISingleEditOperationIdentifier = {
	var major : Float;
	var minor : Float;
};
typedef ISingleEditOperation = {
	var range : IRange;
	var text : String;
	@:optional
	var forceMoveMarkers : Bool;
};
typedef IIdentifiedSingleEditOperation = {
	var range : Range;
	var text : String;
	@:optional
	var forceMoveMarkers : Bool;
};
typedef ICursorStateComputer = { };
extern class TextModelResolvedOptions {
	var _textModelResolvedOptionsBrand : Dynamic;
	var readonly : Dynamic;
	var tabSize : Float;
	var insertSpaces : Bool;
	var defaultEOL : DefaultEndOfLine;
	var trimAutoWhitespace : Bool;
}
typedef ITextModelUpdateOptions = {
	@:optional
	var tabSize : Float;
	@:optional
	var insertSpaces : Bool;
	@:optional
	var trimAutoWhitespace : Bool;
};
extern class FindMatch {
	var _findMatchBrand : Dynamic;
	var readonly : Dynamic;
	var range : Range;
	var matches : Array<String>;
}
@:enum abstract TrackedRangeStickiness(Int) {
	var AlwaysGrowsWhenTypingAtEdges = 0;
	var NeverGrowsWhenTypingAtEdges = 1;
	var GrowsOnlyWhenTypingBefore = 2;
	var GrowsOnlyWhenTypingAfter = 3;
}
typedef ITextModel = {
	var readonly : Dynamic;
	var uri : Uri;
	var id : String;
	function getOptions():TextModelResolvedOptions;
	function getVersionId():Float;
	function getAlternativeVersionId():Float;
	function setValue(newValue:String):Void;
	function getValue(?eol:EndOfLinePreference, ?preserveBOM:Bool):String;
	function getValueLength(?eol:EndOfLinePreference, ?preserveBOM:Bool):Float;
	function getValueInRange(range:IRange, ?eol:EndOfLinePreference):String;
	function getValueLengthInRange(range:IRange):Float;
	function getLineCount():Float;
	function getLineContent(lineNumber:Float):String;
	function getLineLength(lineNumber:Float):Float;
	function getLinesContent():Array<String>;
	function getEOL():String;
	function setEOL(eol:EndOfLineSequence):Void;
	function getLineMinColumn(lineNumber:Float):Float;
	function getLineMaxColumn(lineNumber:Float):Float;
	function getLineFirstNonWhitespaceColumn(lineNumber:Float):Float;
	function getLineLastNonWhitespaceColumn(lineNumber:Float):Float;
	function validatePosition(position:IPosition):Position;
	function modifyPosition(position:IPosition, offset:Float):Position;
	function validateRange(range:IRange):Range;
	function getOffsetAt(position:IPosition):Float;
	function getPositionAt(offset:Float):Position;
	function getFullModelRange():Range;
	function isDisposed():Bool;
	@:overload(function(searchString:String, searchScope:IRange, isRegex:Bool, matchCase:Bool, ?wordSeparators:String, captureMatches:Bool, ?limitResultCount:Float):Array<FindMatch> { })
	function findMatches(searchString:String, searchOnlyEditableRange:Bool, isRegex:Bool, matchCase:Bool, ?wordSeparators:String, captureMatches:Bool, ?limitResultCount:Float):Array<FindMatch>;
	function findNextMatch(searchString:String, searchStart:IPosition, isRegex:Bool, matchCase:Bool, ?wordSeparators:String, captureMatches:Bool):FindMatch;
	function findPreviousMatch(searchString:String, searchStart:IPosition, isRegex:Bool, matchCase:Bool, ?wordSeparators:String, captureMatches:Bool):FindMatch;
	@:overload(function():String { })
	function getModeId():String;
	@:overload(function(position:IPosition):IWordAtPosition { })
	function getWordAtPosition(position:IPosition):IWordAtPosition;
	@:overload(function(position:IPosition):IWordAtPosition { })
	function getWordUntilPosition(position:IPosition):IWordAtPosition;
	function deltaDecorations(oldDecorations:Array<String>, newDecorations:Array<IModelDeltaDecoration>, ?ownerId:Float):Array<String>;
	function getDecorationOptions(id:String):IModelDecorationOptions;
	function getDecorationRange(id:String):Range;
	function getLineDecorations(lineNumber:Float, ?ownerId:Float, ?filterOutValidation:Bool):Array<IModelDecoration>;
	function getLinesDecorations(startLineNumber:Float, endLineNumber:Float, ?ownerId:Float, ?filterOutValidation:Bool):Array<IModelDecoration>;
	function getDecorationsInRange(range:IRange, ?ownerId:Float, ?filterOutValidation:Bool):Array<IModelDecoration>;
	function getAllDecorations(?ownerId:Float, ?filterOutValidation:Bool):Array<IModelDecoration>;
	function getOverviewRulerDecorations(?ownerId:Float, ?filterOutValidation:Bool):Array<IModelDecoration>;
	function normalizeIndentation(str:String):String;
	function getOneIndent():String;
	function updateOptions(newOpts:ITextModelUpdateOptions):Void;
	function detectIndentation(defaultInsertSpaces:Bool, defaultTabSize:Float):Void;
	function pushStackElement():Void;
	function pushEditOperations(beforeCursorState:Array<Selection>, editOperations:Array<IIdentifiedSingleEditOperation>, cursorStateComputer:ICursorStateComputer):Array<Selection>;
	function applyEdits(operations:Array<IIdentifiedSingleEditOperation>):Array<IIdentifiedSingleEditOperation>;
	function onDidChangeContent(listener:IModelContentChangedEvent -> Void):IDisposable;
	function onDidChangeDecorations(listener:IModelDecorationsChangedEvent -> Void):IDisposable;
	function onDidChangeOptions(listener:IModelOptionsChangedEvent -> Void):IDisposable;
	function onDidChangeLanguage(listener:IModelLanguageChangedEvent -> Void):IDisposable;
	function onDidChangeLanguageConfiguration(listener:IModelLanguageConfigurationChangedEvent -> Void):IDisposable;
	function onWillDispose(listener:Void -> Void):IDisposable;
	function dispose():Void;
};
typedef IEditOperationBuilder = {
	function addEditOperation(range:Range, text:String):Void;
	function addTrackedEditOperation(range:Range, text:String):Void;
	function trackSelection(selection:Selection, ?trackPreviousOnEmpty:Bool):String;
};
typedef ICursorStateComputerData = {
	function getInverseEditOperations():Array<IIdentifiedSingleEditOperation>;
	function getTrackedSelection(id:String):Selection;
};
typedef ICommand = {
	function getEditOperations(model:ITextModel, builder:IEditOperationBuilder):Void;
	function computeCursorState(model:ITextModel, helper:ICursorStateComputerData):Selection;
};
typedef IDiffEditorModel = {
	var original : ITextModel;
	var modified : ITextModel;
};
typedef IModelChangedEvent = {
	var readonly : Dynamic;
	var oldModelUrl : Uri;
	var newModelUrl : Uri;
};
typedef IDimension = {
	var width : Float;
	var height : Float;
};
typedef IChange = {
	var readonly : Dynamic;
	var originalStartLineNumber : Float;
	var originalEndLineNumber : Float;
	var modifiedStartLineNumber : Float;
	var modifiedEndLineNumber : Float;
};
typedef ICharChange = {
	>IChange,
	var readonly : Dynamic;
	var originalStartColumn : Float;
	var originalEndColumn : Float;
	var modifiedStartColumn : Float;
	var modifiedEndColumn : Float;
};
typedef ILineChange = {
	>IChange,
	var readonly : Dynamic;
	var charChanges : Array<ICharChange>;
};
typedef INewScrollPosition = {
	@:optional
	var scrollLeft : Float;
	@:optional
	var scrollTop : Float;
};
typedef IEditorAction = {
	var readonly : Dynamic;
	var id : String;
	var label : String;
	var alias : String;
	function isSupported():Bool;
	function run():js.lib.Promise<Void>;
};
typedef ICursorState = {
	var inSelectionMode : Bool;
	var selectionStart : IPosition;
	var position : IPosition;
};
typedef IViewState = {
	@:optional
	var scrollTop : Float;
	@:optional
	var scrollTopWithoutViewZones : Float;
	var scrollLeft : Float;
	var firstPosition : IPosition;
	var firstPositionDeltaTop : Float;
};
typedef ICodeEditorViewState = {
	var cursorState : Array<ICursorState>;
	var viewState : IViewState;
	var contributionsState : { };
};
typedef IDiffEditorViewState = {
	var original : ICodeEditorViewState;
	var modified : ICodeEditorViewState;
};
typedef ScrollType = {};
typedef IEditor = {
	function onDidDispose(listener:Void -> Void):IDisposable;
	function dispose():Void;
	function getId():String;
	function getEditorType():String;
	function updateOptions(newOptions:IEditorOptions):Void;
	function layout(?dimension:IDimension):Void;
	function focus():Void;
	function isFocused():Bool;
	function getSupportedActions():Array<IEditorAction>;
	// function saveViewState():Dynamic;//IEditorViewState;
	// function restoreViewState(state:Dynamic/* IEditorViewState */):Void;
	function getVisibleColumnFromPosition(position:IPosition):Float;
	function getPosition():Position;
	function setPosition(position:IPosition):Void;
	function revealLine(lineNumber:Float, ?scrollType:ScrollType):Void;
	function revealLineInCenter(lineNumber:Float, ?scrollType:ScrollType):Void;
	function revealLineInCenterIfOutsideViewport(lineNumber:Float, ?scrollType:ScrollType):Void;
	function revealPosition(position:IPosition, ?scrollType:ScrollType):Void;
	function revealPositionInCenter(position:IPosition, ?scrollType:ScrollType):Void;
	function revealPositionInCenterIfOutsideViewport(position:IPosition, ?scrollType:ScrollType):Void;
	function getSelection():Selection;
	function getSelections():Array<Selection>;
	@:overload(function(selection:Range):Void { })
	@:overload(function(selection:ISelection):Void { })
	@:overload(function(selection:Selection):Void { })
	function setSelection(selection:IRange):Void;
	function setSelections(selections:Array<ISelection>):Void;
	function revealLines(startLineNumber:Float, endLineNumber:Float, ?scrollType:ScrollType):Void;
	function revealLinesInCenter(lineNumber:Float, endLineNumber:Float, ?scrollType:ScrollType):Void;
	function revealLinesInCenterIfOutsideViewport(lineNumber:Float, endLineNumber:Float, ?scrollType:ScrollType):Void;
	function revealRange(range:IRange, ?scrollType:ScrollType):Void;
	function revealRangeInCenter(range:IRange, ?scrollType:ScrollType):Void;
	function revealRangeAtTop(range:IRange, ?scrollType:ScrollType):Void;
	function revealRangeInCenterIfOutsideViewport(range:IRange, ?scrollType:ScrollType):Void;
	function trigger(source:String, handlerId:String, payload:Dynamic):Void;
	// function getModel():IEditorModel;
	function setModel(model:IEditorModel):Void;
};
typedef IEditorModel = {};
typedef IEditorContribution = {
	function getId():String;
	function dispose():Void;
	@:optional
	function saveViewState():Dynamic;
	@:optional
	function restoreViewState(state:Dynamic):Void;
};
typedef IModelLanguageChangedEvent = {
	var readonly : Dynamic;
	var oldLanguage : String;
	var newLanguage : String;
};
typedef IModelLanguageConfigurationChangedEvent = { };
typedef IModelContentChange = {
	var readonly : Dynamic;
	var range : IRange;
	var rangeOffset : Float;
	var rangeLength : Float;
	var text : String;
};
typedef IModelContentChangedEvent = {
	var readonly : Dynamic;
	var changes : Array<IModelContentChange>;
	var eol : String;
	var versionId : Float;
	var isUndoing : Bool;
	var isRedoing : Bool;
	var isFlush : Bool;
};
typedef IModelDecorationsChangedEvent = { };
typedef IModelTokensChangedEvent = {
	var readonly : Dynamic;
	var ranges : Array<{ var readonly : Dynamic; var fromLineNumber : Float; var toLineNumber : Float; }>;
};
typedef IModelOptionsChangedEvent = {
	var readonly : Dynamic;
	var tabSize : Bool;
	var insertSpaces : Bool;
	var trimAutoWhitespace : Bool;
};
@:enum abstract CursorChangeReason(Int) {
	var NotSet = 0;
	var ContentFlush = 1;
	var RecoverFromMarkers = 2;
	var Explicit = 3;
	var Paste = 4;
	var Undo = 5;
	var Redo = 6;
}
typedef ICursorPositionChangedEvent = {
	var readonly : Dynamic;
	var position : Position;
	var secondaryPositions : Array<Position>;
	var reason : CursorChangeReason;
	var source : String;
};
typedef ICursorSelectionChangedEvent = {
	var readonly : Dynamic;
	var selection : Selection;
	var secondarySelections : Array<Selection>;
	var source : String;
	var reason : CursorChangeReason;
};
typedef IEditorScrollbarOptions = {
	@:optional
	var arrowSize : Float;
	@:optional
	var vertical : String;
	@:optional
	var horizontal : String;
	@:optional
	var useShadows : Bool;
	@:optional
	var verticalHasArrows : Bool;
	@:optional
	var horizontalHasArrows : Bool;
	@:optional
	var handleMouseWheel : Bool;
	@:optional
	var horizontalScrollbarSize : Float;
	@:optional
	var verticalScrollbarSize : Float;
	@:optional
	var verticalSliderSize : Float;
	@:optional
	var horizontalSliderSize : Float;
};
typedef IEditorFindOptions = {
	@:optional
	var seedSearchStringFromSelection : Bool;
	var autoFindInSelection : Bool;
};
typedef IEditorMinimapOptions = {
	@:optional
	var enabled : Bool;
	@:optional
	var side : haxe.extern.EitherType<String, String>;
	@:optional
	var showSlider : haxe.extern.EitherType<String, String>;
	@:optional
	var renderCharacters : Bool;
	@:optional
	var maxColumn : Float;
};
typedef IEditorLightbulbOptions = {
	@:optional
	var enabled : Bool;
};
typedef ICodeActionsOnSaveOptions = { };
typedef IEditorOptions = {
	@:optional
	var ariaLabel : String;
	@:optional
	var rulers : Array<Float>;
	@:optional
	var wordSeparators : String;
	@:optional
	var selectionClipboard : Bool;
	@:optional
	var lineNumbers : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, Float -> String>>>>;
	@:optional
	var selectOnLineNumbers : Bool;
	@:optional
	var lineNumbersMinChars : Float;
	@:optional
	var glyphMargin : Bool;
	@:optional
	var lineDecorationsWidth : haxe.extern.EitherType<Float, String>;
	@:optional
	var revealHorizontalRightPadding : Float;
	@:optional
	var roundedSelection : Bool;
	@:optional
	var extraEditorClassName : String;
	@:optional
	var readOnly : Bool;
	@:optional
	var scrollbar : IEditorScrollbarOptions;
	@:optional
	var minimap : IEditorMinimapOptions;
	@:optional
	var find : IEditorFindOptions;
	@:optional
	var fixedOverflowWidgets : Bool;
	@:optional
	var overviewRulerLanes : Float;
	@:optional
	var overviewRulerBorder : Bool;
	@:optional
	var cursorBlinking : String;
	@:optional
	var mouseWheelZoom : Bool;
	@:optional
	var cursorStyle : String;
	@:optional
	var cursorWidth : Float;
	@:optional
	var fontLigatures : Bool;
	@:optional
	var disableLayerHinting : Bool;
	@:optional
	var disableMonospaceOptimizations : Bool;
	@:optional
	var hideCursorInOverviewRuler : Bool;
	@:optional
	var scrollBeyondLastLine : Bool;
	@:optional
	var smoothScrolling : Bool;
	@:optional
	var automaticLayout : Bool;
	@:optional
	var wordWrap : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>;
	@:optional
	var wordWrapColumn : Float;
	@:optional
	var wordWrapMinified : Bool;
	@:optional
	var wrappingIndent : String;
	@:optional
	var wordWrapBreakBeforeCharacters : String;
	@:optional
	var wordWrapBreakAfterCharacters : String;
	@:optional
	var wordWrapBreakObtrusiveCharacters : String;
	@:optional
	var stopRenderingLineAfter : Float;
	@:optional
	var hover : Bool;
	@:optional
	var links : Bool;
	@:optional
	var colorDecorators : Bool;
	@:optional
	var contextmenu : Bool;
	@:optional
	var mouseWheelScrollSensitivity : Float;
	@:optional
	var multiCursorModifier : haxe.extern.EitherType<String, String>;
	@:optional
	var multiCursorMergeOverlapping : Bool;
	@:optional
	var accessibilitySupport : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	@:optional
	var quickSuggestions : haxe.extern.EitherType<Bool, { var other : Bool; var comments : Bool; var strings : Bool; }>;
	@:optional
	var quickSuggestionsDelay : Float;
	@:optional
	var parameterHints : Bool;
	@:optional
	var iconsInSuggestions : Bool;
	@:optional
	var autoClosingBrackets : Bool;
	@:optional
	var autoIndent : Bool;
	@:optional
	var formatOnType : Bool;
	@:optional
	var formatOnPaste : Bool;
	@:optional
	var dragAndDrop : Bool;
	@:optional
	var suggestOnTriggerCharacters : Bool;
	@:optional
	var acceptSuggestionOnEnter : haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>;
	@:optional
	var acceptSuggestionOnCommitCharacter : Bool;
	@:optional
	var snippetSuggestions : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>;
	@:optional
	var emptySelectionClipboard : Bool;
	@:optional
	var wordBasedSuggestions : Bool;
	@:optional
	var suggestSelection : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	@:optional
	var suggestFontSize : Float;
	@:optional
	var suggestLineHeight : Float;
	@:optional
	var selectionHighlight : Bool;
	@:optional
	var occurrencesHighlight : Bool;
	@:optional
	var codeLens : Bool;
	@:optional
	var lightbulb : IEditorLightbulbOptions;
	@:optional
	var codeActionsOnSave : ICodeActionsOnSaveOptions;
	@:optional
	var codeActionsOnSaveTimeout : Float;
	@:optional
	var folding : Bool;
	@:optional
	var foldingStrategy : haxe.extern.EitherType<String, String>;
	@:optional
	var showFoldingControls : haxe.extern.EitherType<String, String>;
	@:optional
	var matchBrackets : Bool;
	@:optional
	var renderWhitespace : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	@:optional
	var renderControlCharacters : Bool;
	@:optional
	var renderIndentGuides : Bool;
	@:optional
	var renderLineHighlight : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>;
	@:optional
	var useTabStops : Bool;
	@:optional
	var fontFamily : String;
	@:optional
	var fontWeight : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>>>>>>>>>>>>;
	@:optional
	var fontSize : Float;
	@:optional
	var lineHeight : Float;
	@:optional
	var letterSpacing : Float;
};
typedef IDiffEditorOptions = {
	>IEditorOptions,
	@:optional
	var enableSplitViewResizing : Bool;
	@:optional
	var renderSideBySide : Bool;
	@:optional
	var ignoreTrimWhitespace : Bool;
	@:optional
	var renderIndicators : Bool;
	@:optional
	var originalEditable : Bool;
};
@:enum abstract RenderMinimap(Int) {
	var None = 0;
	var Small = 1;
	var Large = 2;
	var SmallBlocks = 3;
	var LargeBlocks = 4;
}
@:enum abstract WrappingIndent(Int) {
	var None = 0;
	var Same = 1;
	var Indent = 2;
}
@:enum abstract TextEditorCursorBlinkingStyle(Int) {
	var Hidden = 0;
	var Blink = 1;
	var Smooth = 2;
	var Phase = 3;
	var Expand = 4;
	var Solid = 5;
}
@:enum abstract TextEditorCursorStyle(Int) {
	var Line = 1;
	var Block = 2;
	var Underline = 3;
	var LineThin = 4;
	var BlockOutline = 5;
	var UnderlineThin = 6;
}
typedef InternalEditorScrollbarOptions = {
	var readonly : Dynamic;
	var arrowSize : Float;
	var vertical : ScrollbarVisibility;
	var horizontal : ScrollbarVisibility;
	var useShadows : Bool;
	var verticalHasArrows : Bool;
	var horizontalHasArrows : Bool;
	var handleMouseWheel : Bool;
	var horizontalScrollbarSize : Float;
	var horizontalSliderSize : Float;
	var verticalScrollbarSize : Float;
	var verticalSliderSize : Float;
	var mouseWheelScrollSensitivity : Float;
};
typedef InternalEditorMinimapOptions = {
	var readonly : Dynamic;
	var enabled : Bool;
	var side : haxe.extern.EitherType<String, String>;
	var showSlider : haxe.extern.EitherType<String, String>;
	var renderCharacters : Bool;
	var maxColumn : Float;
};
typedef InternalEditorFindOptions = {
	var readonly : Dynamic;
	var seedSearchStringFromSelection : Bool;
	var autoFindInSelection : Bool;
};
typedef EditorWrappingInfo = {
	var readonly : Dynamic;
	var inDiffEditor : Bool;
	var isDominatedByLongLines : Bool;
	var isWordWrapMinified : Bool;
	var isViewportWrapping : Bool;
	var wrappingColumn : Float;
	var wrappingIndent : WrappingIndent;
	var wordWrapBreakBeforeCharacters : String;
	var wordWrapBreakAfterCharacters : String;
	var wordWrapBreakObtrusiveCharacters : String;
};
typedef RenderLineNumbersType = {};
typedef InternalEditorViewOptions = {
	var readonly : Dynamic;
	var extraEditorClassName : String;
	var disableMonospaceOptimizations : Bool;
	var rulers : Array<Float>;
	var ariaLabel : String;
	var renderLineNumbers : RenderLineNumbersType;
	var renderCustomLineNumbers : Float -> String;
	var selectOnLineNumbers : Bool;
	var glyphMargin : Bool;
	var revealHorizontalRightPadding : Float;
	var roundedSelection : Bool;
	var overviewRulerLanes : Float;
	var overviewRulerBorder : Bool;
	var cursorBlinking : TextEditorCursorBlinkingStyle;
	var mouseWheelZoom : Bool;
	var cursorStyle : TextEditorCursorStyle;
	var cursorWidth : Float;
	var hideCursorInOverviewRuler : Bool;
	var scrollBeyondLastLine : Bool;
	var smoothScrolling : Bool;
	var stopRenderingLineAfter : Float;
	var renderWhitespace : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	var renderControlCharacters : Bool;
	var fontLigatures : Bool;
	var renderIndentGuides : Bool;
	var renderLineHighlight : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>;
	var scrollbar : InternalEditorScrollbarOptions;
	var minimap : InternalEditorMinimapOptions;
	var fixedOverflowWidgets : Bool;
};
typedef EditorContribOptions = {
	var readonly : Dynamic;
	var selectionClipboard : Bool;
	var hover : Bool;
	var links : Bool;
	var contextmenu : Bool;
	var quickSuggestions : haxe.extern.EitherType<Bool, { var other : Bool; var comments : Bool; var strings : Bool; }>;
	var quickSuggestionsDelay : Float;
	var parameterHints : Bool;
	var iconsInSuggestions : Bool;
	var formatOnType : Bool;
	var formatOnPaste : Bool;
	var suggestOnTriggerCharacters : Bool;
	var acceptSuggestionOnEnter : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	var acceptSuggestionOnCommitCharacter : Bool;
	var snippetSuggestions : haxe.extern.EitherType<String, haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>>;
	var wordBasedSuggestions : Bool;
	var suggestSelection : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	var suggestFontSize : Float;
	var suggestLineHeight : Float;
	var selectionHighlight : Bool;
	var occurrencesHighlight : Bool;
	var codeLens : Bool;
	var folding : Bool;
	var foldingStrategy : haxe.extern.EitherType<String, String>;
	var showFoldingControls : haxe.extern.EitherType<String, String>;
	var matchBrackets : Bool;
	var find : InternalEditorFindOptions;
	var colorDecorators : Bool;
	var lightbulbEnabled : Bool;
	var codeActionsOnSave : ICodeActionsOnSaveOptions;
	var codeActionsOnSaveTimeout : Float;
};
extern class InternalEditorOptions {
	var readonly : Dynamic;
	var _internalEditorOptionsBrand : Dynamic;
	var canUseLayerHinting : Bool;
	var pixelRatio : Float;
	var editorClassName : String;
	var lineHeight : Float;
	var readOnly : Bool;
	var multiCursorModifier : haxe.extern.EitherType<String, haxe.extern.EitherType<String, String>>;
	var multiCursorMergeOverlapping : Bool;
	var wordSeparators : String;
	var autoClosingBrackets : Bool;
	var autoIndent : Bool;
	var useTabStops : Bool;
	var tabFocusMode : Bool;
	var dragAndDrop : Bool;
	var emptySelectionClipboard : Bool;
	var layoutInfo : EditorLayoutInfo;
	var fontInfo : FontInfo;
	var viewInfo : InternalEditorViewOptions;
	var wrappingInfo : EditorWrappingInfo;
	var contribInfo : EditorContribOptions;
}
typedef OverviewRulerPosition = {
	var readonly : Dynamic;
	var width : Float;
	var height : Float;
	var top : Float;
	var right : Float;
};
typedef EditorLayoutInfo = {
	var readonly : Dynamic;
	var width : Float;
	var height : Float;
	var glyphMarginLeft : Float;
	var glyphMarginWidth : Float;
	var glyphMarginHeight : Float;
	var lineNumbersLeft : Float;
	var lineNumbersWidth : Float;
	var lineNumbersHeight : Float;
	var decorationsLeft : Float;
	var decorationsWidth : Float;
	var decorationsHeight : Float;
	var contentLeft : Float;
	var contentWidth : Float;
	var contentHeight : Float;
	var minimapLeft : Float;
	var minimapWidth : Float;
	var renderMinimap : RenderMinimap;
	var viewportColumn : Float;
	var verticalScrollbarWidth : Float;
	var horizontalScrollbarHeight : Float;
	var overviewRuler : OverviewRulerPosition;
};
typedef IConfigurationChangedEvent = {
	var readonly : Dynamic;
	var canUseLayerHinting : Bool;
	var pixelRatio : Bool;
	var editorClassName : Bool;
	var lineHeight : Bool;
	var readOnly : Bool;
	var accessibilitySupport : Bool;
	var multiCursorModifier : Bool;
	var multiCursorMergeOverlapping : Bool;
	var wordSeparators : Bool;
	var autoClosingBrackets : Bool;
	var autoIndent : Bool;
	var useTabStops : Bool;
	var tabFocusMode : Bool;
	var dragAndDrop : Bool;
	var emptySelectionClipboard : Bool;
	var layoutInfo : Bool;
	var fontInfo : Bool;
	var viewInfo : Bool;
	var wrappingInfo : Bool;
	var contribInfo : Bool;
};
typedef IViewZone = {
	var afterLineNumber : Float;
	@:optional
	var afterColumn : Float;
	@:optional
	var suppressMouseDown : Bool;
	@:optional
	var heightInLines : Float;
	@:optional
	var heightInPx : Float;
	var domNode : js.html.Element;
	@:optional
	var marginDomNode : js.html.Element;
	@:optional
	var onDomNodeTop : Float -> Void;
	@:optional
	var onComputedHeight : Float -> Void;
};
typedef IViewZoneChangeAccessor = {
	function addZone(zone:IViewZone):Float;
	function removeZone(id:Float):Void;
	function layoutZone(id:Float):Void;
};
@:enum abstract ContentWidgetPositionPreference(Int) {
	var EXACT = 0;
	var ABOVE = 1;
	var BELOW = 2;
}
typedef IContentWidgetPosition = {
	var position : IPosition;
	var preference : Array<ContentWidgetPositionPreference>;
};
typedef IContentWidget = {
	@:optional
	var allowEditorOverflow : Bool;
	@:optional
	var suppressMouseDown : Bool;
	function getId():String;
	function getDomNode():js.html.Element;
	function getPosition():IContentWidgetPosition;
};
@:enum abstract OverlayWidgetPositionPreference(Int) {
	var TOP_RIGHT_CORNER = 0;
	var BOTTOM_RIGHT_CORNER = 1;
	var TOP_CENTER = 2;
}
typedef IOverlayWidgetPosition = {
	var preference : OverlayWidgetPositionPreference;
};
typedef IOverlayWidget = {
	function getId():String;
	function getDomNode():js.html.Element;
	function getPosition():IOverlayWidgetPosition;
};
@:enum abstract MouseTargetType(Int) {
	var UNKNOWN = 0;
	var TEXTAREA = 1;
	var GUTTER_GLYPH_MARGIN = 2;
	var GUTTER_LINE_NUMBERS = 3;
	var GUTTER_LINE_DECORATIONS = 4;
	var GUTTER_VIEW_ZONE = 5;
	var CONTENT_TEXT = 6;
	var CONTENT_EMPTY = 7;
	var CONTENT_VIEW_ZONE = 8;
	var CONTENT_WIDGET = 9;
	var OVERVIEW_RULER = 10;
	var SCROLLBAR = 11;
	var OVERLAY_WIDGET = 12;
	var OUTSIDE_EDITOR = 13;
}
typedef IMouseTarget = {
	var readonly : Dynamic;
	var element : js.html.Element;
	var type : MouseTargetType;
	var position : Position;
	var mouseColumn : Float;
	var range : Range;
	var detail : Dynamic;
};
typedef IEditorMouseEvent = {
	var readonly : Dynamic;
	var event : IMouseEvent;
	var target : IMouseTarget;
};
typedef ICodeEditor = {
	>IEditor,
	function onDidChangeModelContent(listener:IModelContentChangedEvent -> Void):IDisposable;
	function onDidChangeModelLanguage(listener:IModelLanguageChangedEvent -> Void):IDisposable;
	function onDidChangeModelLanguageConfiguration(listener:IModelLanguageConfigurationChangedEvent -> Void):IDisposable;
	function onDidChangeModelOptions(listener:IModelOptionsChangedEvent -> Void):IDisposable;
	function onDidChangeConfiguration(listener:IConfigurationChangedEvent -> Void):IDisposable;
	function onDidChangeCursorPosition(listener:ICursorPositionChangedEvent -> Void):IDisposable;
	function onDidChangeCursorSelection(listener:ICursorSelectionChangedEvent -> Void):IDisposable;
	function onDidChangeModel(listener:IModelChangedEvent -> Void):IDisposable;
	function onDidChangeModelDecorations(listener:IModelDecorationsChangedEvent -> Void):IDisposable;
	function onDidFocusEditorText(listener:Void -> Void):IDisposable;
	function onDidBlurEditorText(listener:Void -> Void):IDisposable;
	function onDidFocusEditor(listener:Void -> Void):IDisposable;
	function onDidBlurEditor(listener:Void -> Void):IDisposable;
	function onMouseUp(listener:IEditorMouseEvent -> Void):IDisposable;
	function onMouseDown(listener:IEditorMouseEvent -> Void):IDisposable;
	function onContextMenu(listener:IEditorMouseEvent -> Void):IDisposable;
	function onMouseMove(listener:IEditorMouseEvent -> Void):IDisposable;
	function onMouseLeave(listener:IEditorMouseEvent -> Void):IDisposable;
	function onKeyUp(listener:IKeyboardEvent -> Void):IDisposable;
	function onKeyDown(listener:IKeyboardEvent -> Void):IDisposable;
	function onDidLayoutChange(listener:EditorLayoutInfo -> Void):IDisposable;
	function onDidScrollChange(listener:IScrollEvent -> Void):IDisposable;
	function saveViewState():ICodeEditorViewState;
	function restoreViewState(state:ICodeEditorViewState):Void;
	function hasWidgetFocus():Bool;
	function getContribution<T:(IEditorContribution)>(id:String):T;
	function getModel():ITextModel;
	function getConfiguration():InternalEditorOptions;
	function getValue(?options:{ var preserveBOM : Bool; var lineEnding : String; }):String;
	function setValue(newValue:String):Void;
	function getScrollWidth():Float;
	function getScrollLeft():Float;
	function getScrollHeight():Float;
	function getScrollTop():Float;
	function setScrollLeft(newScrollLeft:Float):Void;
	function setScrollTop(newScrollTop:Float):Void;
	function setScrollPosition(position:INewScrollPosition):Void;
	function getAction(id:String):IEditorAction;
	function executeCommand(source:String, command:ICommand):Void;
	function pushUndoStop():Bool;
	function executeEdits(source:String, edits:Array<IIdentifiedSingleEditOperation>, ?endCursoState:Array<Selection>):Bool;
	function executeCommands(source:String, commands:Array<ICommand>):Void;
	function getLineDecorations(lineNumber:Float):Array<IModelDecoration>;
	function deltaDecorations(oldDecorations:Array<String>, newDecorations:Array<IModelDeltaDecoration>):Array<String>;
	function getLayoutInfo():EditorLayoutInfo;
	function getVisibleRanges():Array<Range>;
	function getTopForLineNumber(lineNumber:Float):Float;
	function getTopForPosition(lineNumber:Float, column:Float):Float;
	function getDomNode():js.html.Element;
	function addContentWidget(widget:IContentWidget):Void;
	function layoutContentWidget(widget:IContentWidget):Void;
	function removeContentWidget(widget:IContentWidget):Void;
	function addOverlayWidget(widget:IOverlayWidget):Void;
	function layoutOverlayWidget(widget:IOverlayWidget):Void;
	function removeOverlayWidget(widget:IOverlayWidget):Void;
	function changeViewZones(callback:IViewZoneChangeAccessor -> Void):Void;
	function getOffsetForColumn(lineNumber:Float, column:Float):Float;
	function render():Void;
	function getTargetAtClientPoint(clientX:Float, clientY:Float):IMouseTarget;
	function getScrolledVisiblePosition(position:IPosition):{ var top : Float; var left : Float; var height : Float; };
	function applyFontInfo(target:js.html.Element):Void;
};
typedef IDiffLineInformation = {
	var readonly : Dynamic;
	var equivalentLineNumber : Float;
};
typedef IDiffEditor = {
	>IEditor,
	function getDomNode():js.html.Element;
	function onDidUpdateDiff(listener:Void -> Void):IDisposable;
	// function saveViewState():IDiffEditorViewState;
	// function restoreViewState(state:IDiffEditorViewState):Void;
	// function getModel():IDiffEditorModel;
	// function getOriginalEditor():ICodeEditor;
	// function getModifiedEditor():ICodeEditor;
	function getLineChanges():Array<ILineChange>;
	function getDiffLineInformationForOriginal(lineNumber:Float):IDiffLineInformation;
	function getDiffLineInformationForModified(lineNumber:Float):IDiffLineInformation;
};
extern class FontInfo extends BareFontInfo {
	// var readonly : Dynamic;
	var _editorStylingBrand : Dynamic;
	var isTrusted : Bool;
	var isMonospace : Bool;
	var typicalHalfwidthCharacterWidth : Float;
	var typicalFullwidthCharacterWidth : Float;
	var spaceWidth : Float;
	var maxDigitWidth : Float;
}
extern class BareFontInfo {
	var readonly : Dynamic;
	var _bareFontInfoBrand : Dynamic;
	var zoomLevel : Float;
	var fontFamily : String;
	var fontWeight : String;
	var fontSize : Float;
	var lineHeight : Float;
	var letterSpacing : Float;
}
extern class Editor {
	function create(domElement:js.html.Element, ?options:IEditorConstructionOptions/* , ?override:IEditorOverrideServices */):IStandaloneCodeEditor;
	function onDidCreateEditor(listener:ICodeEditor -> Void):IDisposable;
	function createDiffEditor(domElement:js.html.Element, ?options:IDiffEditorConstructionOptions/* , ?override:IEditorOverrideServices */):IStandaloneDiffEditor;
	function createDiffNavigator(diffEditor:IStandaloneDiffEditor, ?opts:IDiffNavigatorOptions):IDiffNavigator;
	function createModel(value:String, ?language:String, ?uri:Uri):ITextModel;
	function setModelLanguage(model:ITextModel, language:String):Void;
	function setModelMarkers(model:ITextModel, owner:String, markers:Array<IMarkerData>):Void;
	function getModelMarkers(filter:{ @:optional
	var owner : String; @:optional
	var resource : Uri; @:optional
	var take : Float; }):Array<IMarker>;
	function getModel(uri:Uri):ITextModel;
	function getModels():Array<ITextModel>;
	function onDidCreateModel(listener:ITextModel -> Void):IDisposable;
	function onWillDisposeModel(listener:ITextModel -> Void):IDisposable;
	function onDidChangeModelLanguage(listener:{ var readonly : Dynamic; var model : ITextModel; var oldLanguage : String; } -> Void):IDisposable;
	function createWebWorker<T>(opts:IWebWorkerOptions):MonacoWebWorker<T>;
	function colorizeElement(domNode:js.html.Element, options:IColorizerElementOptions):js.lib.Promise<Void>;
	function colorize(text:String, languageId:String, options:IColorizerOptions):js.lib.Promise<String>;
	function colorizeModelLine(model:ITextModel, lineNumber:Float, ?tabSize:Float):String;
	function tokenize(text:String, languageId:String):Array<Array<Token>>;
	function defineTheme(themeName:String, themeData:IStandaloneThemeData):Void;
	function setTheme(themeName:String):Void;
	var EditorType : { var ICodeEditor : String; var IDiffEditor : String; };
}
