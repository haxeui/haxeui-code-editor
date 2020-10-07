package monaco;

import Monaco;
import monaco.Editor;

typedef IToken = {
	var startIndex : Float;
	var scopes : String;
};
typedef ILineTokens = {
	var tokens : Array<IToken>;
	var endState : IState;
};
typedef TokensProvider = {
	function getInitialState():IState;
	function tokenize(line:String, state:IState):ILineTokens;
};
typedef CodeActionContext = {
	var readonly : Dynamic;
	var markers : Array<IMarkerData>;
	@:optional
	var only : String;
};
typedef CodeActionProvider = {
	function provideCodeActions(model:ITextModel, range:Range, context:CodeActionContext, token:CancellationToken):haxe.extern.EitherType<Array<haxe.extern.EitherType<Command, CodeAction>>, Dynamic/* Thenable<Array<haxe.extern.EitherType<Command, CodeAction>>> */>;
};
@:enum abstract CompletionItemKind(Int) {
	var Text = 0;
	var Method = 1;
	var Function = 2;
	var Constructor = 3;
	var Field = 4;
	var Variable = 5;
	var Class = 6;
	var Interface = 7;
	var Module = 8;
	var Property = 9;
	var Unit = 10;
	var Value = 11;
	var Enum = 12;
	var Keyword = 13;
	var Snippet = 14;
	var Color = 15;
	var File = 16;
	var Reference = 17;
	var Folder = 18;
}
typedef SnippetString = {
	var value : String;
};
typedef CompletionItem = {
	var label : String;
	var kind : CompletionItemKind;
	@:optional
	var detail : String;
	@:optional
	var documentation : haxe.extern.EitherType<String, IMarkdownString>;
	@:optional
	var command : Command;
	@:optional
	var sortText : String;
	@:optional
	var filterText : String;
	@:optional
	var insertText : haxe.extern.EitherType<String, SnippetString>;
	@:optional
	var range : Range;
	@:optional
	var commitCharacters : Array<String>;
	@:optional
	var textEdit : ISingleEditOperation;
	@:optional
	var additionalTextEdits : Array<ISingleEditOperation>;
};
typedef CompletionList = {
	@:optional
	var isIncomplete : Bool;
	var suggestions : Array<CompletionItem>;
};
typedef CompletionContext = {
	var triggerKind : SuggestTriggerKind;
	@:optional
	var triggerCharacter : String;
};
typedef CompletionItemProvider = {
	@:optional
	var triggerCharacters : Array<String>;
	function provideCompletionItems(document:ITextModel, position:Position, token:CancellationToken, context:CompletionContext):haxe.extern.EitherType<Array<CompletionItem>, haxe.extern.EitherType<Thenable<Array<CompletionItem>>, haxe.extern.EitherType<CompletionList, Thenable<CompletionList>>>>;
	@:optional
	function resolveCompletionItem(item:CompletionItem, token:CancellationToken):haxe.extern.EitherType<CompletionItem, Thenable<CompletionItem>>;
};
typedef Thenable<T> = Dynamic;
typedef CommentRule = {
	@:optional
	var lineComment : String;
	@:optional
	var blockComment : CharacterPair;
};
typedef CharacterPair = Dynamic;
typedef LanguageConfiguration = {
	@:optional
	var comments : CommentRule;
	@:optional
	var brackets : Array<CharacterPair>;
	@:optional
	var wordPattern : js.lib.RegExp;
	@:optional
	var indentationRules : IndentationRule;
	@:optional
	var onEnterRules : Array<OnEnterRule>;
	@:optional
	var autoClosingPairs : Array<IAutoClosingPairConditional>;
	@:optional
	var surroundingPairs : Array<IAutoClosingPair>;
	@:optional
	var folding : FoldingRules;
	@:optional
	var __electricCharacterSupport : IBracketElectricCharacterContribution;
};
typedef IndentationRule = {
	var decreaseIndentPattern : js.lib.RegExp;
	var increaseIndentPattern : js.lib.RegExp;
	@:optional
	var indentNextLinePattern : js.lib.RegExp;
	@:optional
	var unIndentedLinePattern : js.lib.RegExp;
};
typedef FoldingMarkers = {
	var start : js.lib.RegExp;
	var end : js.lib.RegExp;
};
typedef FoldingRules = {
	@:optional
	var offSide : Bool;
	@:optional
	var markers : FoldingMarkers;
};
typedef OnEnterRule = {
	var beforeText : js.lib.RegExp;
	@:optional
	var afterText : js.lib.RegExp;
	var action : EnterAction;
};
typedef IBracketElectricCharacterContribution = {
	@:optional
	var docComment : IDocComment;
};
typedef IDocComment = {
	var open : String;
	var close : String;
};
typedef IAutoClosingPair = {
	var open : String;
	var close : String;
};
typedef IAutoClosingPairConditional = {
	>IAutoClosingPair,
	@:optional
	var notIn : Array<String>;
};
@:enum abstract IndentAction(Int) {
	var None = 0;
	var Indent = 1;
	var IndentOutdent = 2;
	var Outdent = 3;
}
typedef EnterAction = {
	var indentAction : IndentAction;
	@:optional
	var outdentCurrentLine : Bool;
	@:optional
	var appendText : String;
	@:optional
	var removeText : Float;
};
typedef IState = {
	function clone():IState;
	function equals(other:IState):Bool;
};
typedef Hover = {
	var contents : Array<IMarkdownString>;
	@:optional
	var range : IRange;
};
typedef HoverProvider = {
	function provideHover(model:ITextModel, position:Position, token:CancellationToken):haxe.extern.EitherType<Hover, Thenable<Hover>>;
};
@:enum abstract SuggestTriggerKind(Int) {
	var Invoke = 0;
	var TriggerCharacter = 1;
	var TriggerForIncompleteCompletions = 2;
}
typedef CodeAction = {
	var title : String;
	@:optional
	var command : Command;
	@:optional
	var edit : WorkspaceEdit;
	@:optional
	var diagnostics : Array<IMarkerData>;
	@:optional
	var kind : String;
};
typedef ParameterInformation = {
	var label : String;
	@:optional
	var documentation : haxe.extern.EitherType<String, IMarkdownString>;
};
typedef SignatureInformation = {
	var label : String;
	@:optional
	var documentation : haxe.extern.EitherType<String, IMarkdownString>;
	var parameters : Array<ParameterInformation>;
};
typedef SignatureHelp = {
	var signatures : Array<SignatureInformation>;
	var activeSignature : Float;
	var activeParameter : Float;
};
typedef SignatureHelpProvider = {
	var signatureHelpTriggerCharacters : Array<String>;
	function provideSignatureHelp(model:ITextModel, position:Position, token:CancellationToken):haxe.extern.EitherType<SignatureHelp, Thenable<SignatureHelp>>;
};
@:enum abstract DocumentHighlightKind(Int) {
	var Text = 0;
	var Read = 1;
	var Write = 2;
}
typedef DocumentHighlight = {
	var range : IRange;
	var kind : DocumentHighlightKind;
};
typedef DocumentHighlightProvider = {
	function provideDocumentHighlights(model:ITextModel, position:Position, token:CancellationToken):haxe.extern.EitherType<Array<DocumentHighlight>, Thenable<Array<DocumentHighlight>>>;
};
typedef ReferenceContext = {
	var includeDeclaration : Bool;
};
typedef ReferenceProvider = {
	function provideReferences(model:ITextModel, position:Position, context:ReferenceContext, token:CancellationToken):haxe.extern.EitherType<Array<Location>, Thenable<Array<Location>>>;
};
typedef Location = {
	var uri : Uri;
	var range : IRange;
};
typedef DefinitionProvider = {
	function provideDefinition(model:ITextModel, position:Position, token:CancellationToken):haxe.extern.EitherType<Definition, Thenable<Definition>>;
};
typedef Definition = Dynamic;
typedef ImplementationProvider = {
	function provideImplementation(model:ITextModel, position:Position, token:CancellationToken):haxe.extern.EitherType<Definition, Thenable<Definition>>;
};
typedef TypeDefinitionProvider = {
	function provideTypeDefinition(model:ITextModel, position:Position, token:CancellationToken):haxe.extern.EitherType<Definition, Thenable<Definition>>;
};
@:enum abstract SymbolKind(Int) {
	var File = 0;
	var Module = 1;
	var Namespace = 2;
	var Package = 3;
	var Class = 4;
	var Method = 5;
	var Property = 6;
	var Field = 7;
	var Constructor = 8;
	var Enum = 9;
	var Interface = 10;
	var Function = 11;
	var Variable = 12;
	var Constant = 13;
	var String = 14;
	var Number = 15;
	var Boolean = 16;
	var Array = 17;
	var Object = 18;
	var Key = 19;
	var Null = 20;
	var EnumMember = 21;
	var Struct = 22;
	var Event = 23;
	var Operator = 24;
	var TypeParameter = 25;
}
typedef SymbolInformation = {
	var name : String;
	@:optional
	var containerName : String;
	var kind : SymbolKind;
	var location : Location;
};
typedef DocumentSymbolProvider = {
	function provideDocumentSymbols(model:ITextModel, token:CancellationToken):haxe.extern.EitherType<Array<SymbolInformation>, Thenable<Array<SymbolInformation>>>;
};
typedef TextEdit = {
	var range : IRange;
	var text : String;
	@:optional
	var eol : EndOfLineSequence;
};
typedef FormattingOptions = {
	var tabSize : Float;
	var insertSpaces : Bool;
};
typedef DocumentFormattingEditProvider = {
	function provideDocumentFormattingEdits(model:ITextModel, options:FormattingOptions, token:CancellationToken):haxe.extern.EitherType<Array<TextEdit>, Thenable<Array<TextEdit>>>;
};
typedef DocumentRangeFormattingEditProvider = {
	function provideDocumentRangeFormattingEdits(model:ITextModel, range:Range, options:FormattingOptions, token:CancellationToken):haxe.extern.EitherType<Array<TextEdit>, Thenable<Array<TextEdit>>>;
};
typedef OnTypeFormattingEditProvider = {
	var autoFormatTriggerCharacters : Array<String>;
	function provideOnTypeFormattingEdits(model:ITextModel, position:Position, ch:String, options:FormattingOptions, token:CancellationToken):haxe.extern.EitherType<Array<TextEdit>, Thenable<Array<TextEdit>>>;
};
typedef ILink = {
	var range : IRange;
	@:optional
	var url : String;
};
typedef LinkProvider = {
	function provideLinks(model:ITextModel, token:CancellationToken):haxe.extern.EitherType<Array<ILink>, Thenable<Array<ILink>>>;
	@:optional
	var resolveLink : ILink -> CancellationToken -> haxe.extern.EitherType<ILink, Thenable<ILink>>;
};
typedef IColor = {
	var readonly : Dynamic;
	var red : Float;
	var green : Float;
	var blue : Float;
	var alpha : Float;
};
typedef IColorPresentation = {
	var label : String;
	@:optional
	var textEdit : TextEdit;
	@:optional
	var additionalTextEdits : Array<TextEdit>;
};
typedef IColorInformation = {
	var range : IRange;
	var color : IColor;
};
typedef DocumentColorProvider = {
	function provideDocumentColors(model:ITextModel, token:CancellationToken):haxe.extern.EitherType<Array<IColorInformation>, Thenable<Array<IColorInformation>>>;
	function provideColorPresentations(model:ITextModel, colorInfo:IColorInformation, token:CancellationToken):haxe.extern.EitherType<Array<IColorPresentation>, Thenable<Array<IColorPresentation>>>;
};
typedef FoldingContext = { };
typedef FoldingRangeProvider = {
	function provideFoldingRanges(model:ITextModel, context:FoldingContext, token:CancellationToken):haxe.extern.EitherType<Array<FoldingRange>, Thenable<Array<FoldingRange>>>;
};
typedef FoldingRange = {
	var start : Float;
	var end : Float;
	@:optional
	var kind : FoldingRangeKind;
};
extern class FoldingRangeKind {
	var value : String;
	static var readonly : Dynamic;
	var Comment : FoldingRangeKind;
	var Imports : FoldingRangeKind;
	var Region : FoldingRangeKind;
	function new(value:String):Void;
}
typedef ResourceFileEdit = {
	var oldUri : Uri;
	var newUri : Uri;
};
typedef ResourceTextEdit = {
	var resource : Uri;
	@:optional
	var modelVersionId : Float;
	var edits : Array<TextEdit>;
};
typedef WorkspaceEdit = {
	var edits : Array<haxe.extern.EitherType<ResourceTextEdit, ResourceFileEdit>>;
	@:optional
	var rejectReason : String;
};
typedef RenameLocation = {
	var range : IRange;
	var text : String;
};
typedef RenameProvider = {
	function provideRenameEdits(model:ITextModel, position:Position, newName:String, token:CancellationToken):haxe.extern.EitherType<WorkspaceEdit, Thenable<WorkspaceEdit>>;
	@:optional
	function resolveRenameLocation(model:ITextModel, position:Position, token:CancellationToken):haxe.extern.EitherType<RenameLocation, Thenable<RenameLocation>>;
};
typedef Command = {
	var id : String;
	var title : String;
	@:optional
	var tooltip : String;
	@:optional
	var arguments : Array<Dynamic>;
};
typedef ICodeLensSymbol = {
	var range : IRange;
	@:optional
	var id : String;
	@:optional
	var command : Command;
};
typedef CodeLensProvider = {
	@:optional
	var onDidChange : IEvent<Dynamic/* This */>;
	function provideCodeLenses(model:ITextModel, token:CancellationToken):haxe.extern.EitherType<Array<ICodeLensSymbol>, Thenable<Array<ICodeLensSymbol>>>;
	@:optional
	function resolveCodeLens(model:ITextModel, codeLens:ICodeLensSymbol, token:CancellationToken):haxe.extern.EitherType<ICodeLensSymbol, Thenable<ICodeLensSymbol>>;
};
typedef ILanguageExtensionPoint = {
	var id : String;
	@:optional
	var extensions : Array<String>;
	@:optional
	var filenames : Array<String>;
	@:optional
	var filenamePatterns : Array<String>;
	@:optional
	var firstLine : String;
	@:optional
	var aliases : Array<String>;
	@:optional
	var mimetypes : Array<String>;
	@:optional
	var configuration : String;
};
typedef IMonarchLanguage = {
	var tokenizer : { };
	@:optional
	var ignoreCase : Bool;
	@:optional
	var defaultToken : String;
	@:optional
	var brackets : Array<IMonarchLanguageBracket>;
	@:optional
	var start : String;
	var tokenPostfix : String;
};
typedef IMonarchLanguageRule = {
	@:optional
	var regex : haxe.extern.EitherType<String, js.lib.RegExp>;
	@:optional
	var action : IMonarchLanguageAction;
	@:optional
	var include : String;
};
typedef IMonarchLanguageAction = {
	@:optional
	var group : Array<IMonarchLanguageAction>;
	@:optional
	var cases : Dynamic;
	@:optional
	var token : String;
	@:optional
	var next : String;
	@:optional
	var switchTo : String;
	@:optional
	var goBack : Float;
	@:optional
	var bracket : String;
	@:optional
	var nextEmbedded : String;
	@:optional
	var log : String;
};
typedef IMonarchLanguageBracket = {
	var open : String;
	var close : String;
	var token : String;
};
extern class Languages {
	function register(language:ILanguageExtensionPoint):Void;
	function getLanguages():Array<ILanguageExtensionPoint>;
	function onLanguage(languageId:String, callback:Void -> Void):IDisposable;
	function setLanguageConfiguration(languageId:String, configuration:LanguageConfiguration):IDisposable;
	function setTokensProvider(languageId:String, provider:TokensProvider):IDisposable;
	function setMonarchTokensProvider(languageId:String, languageDef:IMonarchLanguage):IDisposable;
	function registerReferenceProvider(languageId:String, provider:ReferenceProvider):IDisposable;
	function registerRenameProvider(languageId:String, provider:RenameProvider):IDisposable;
	function registerSignatureHelpProvider(languageId:String, provider:SignatureHelpProvider):IDisposable;
	function registerHoverProvider(languageId:String, provider:HoverProvider):IDisposable;
	function registerDocumentSymbolProvider(languageId:String, provider:DocumentSymbolProvider):IDisposable;
	function registerDocumentHighlightProvider(languageId:String, provider:DocumentHighlightProvider):IDisposable;
	function registerDefinitionProvider(languageId:String, provider:DefinitionProvider):IDisposable;
	function registerImplementationProvider(languageId:String, provider:ImplementationProvider):IDisposable;
	function registerTypeDefinitionProvider(languageId:String, provider:TypeDefinitionProvider):IDisposable;
	function registerCodeLensProvider(languageId:String, provider:CodeLensProvider):IDisposable;
	function registerCodeActionProvider(languageId:String, provider:CodeActionProvider):IDisposable;
	function registerDocumentFormattingEditProvider(languageId:String, provider:DocumentFormattingEditProvider):IDisposable;
	function registerDocumentRangeFormattingEditProvider(languageId:String, provider:DocumentRangeFormattingEditProvider):IDisposable;
	function registerOnTypeFormattingEditProvider(languageId:String, provider:OnTypeFormattingEditProvider):IDisposable;
	function registerLinkProvider(languageId:String, provider:LinkProvider):IDisposable;
	function registerCompletionItemProvider(languageId:String, provider:CompletionItemProvider):IDisposable;
	function registerColorProvider(languageId:String, provider:DocumentColorProvider):IDisposable;
	function registerFoldingRangeProvider(languageId:String, provider:FoldingRangeProvider):IDisposable;
}
