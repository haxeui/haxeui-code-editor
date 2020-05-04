typedef IDisposable = {
	function dispose():Void;
};
typedef IEvent<T> = { };
extern class Emitter<T> {
	function new():Void;
	var readonly : Dynamic;
	var event : IEvent<T>;
	function fire(?event:T):Void;
	function dispose():Void;
}
@:enum abstract Severity(Int) {
	var Ignore = 0;
	var Info = 1;
	var Warning = 2;
	var Error = 3;
}
@:enum abstract MarkerSeverity(Int) {
	var Hint = 1;
	var Info = 2;
	var Warning = 4;
	var Error = 8;
}
// extern class Promise<T, TProgress> {
// 	function new(executor:(haxe.extern.EitherType<T, PromiseLike<T>> -> Void) -> (Dynamic -> Void) -> (TProgress -> Void) -> Void, ?oncancel:Void -> Void):Void;
// 	function then<TResult1, TResult2>(?onfulfilled:haxe.extern.EitherType<T -> haxe.extern.EitherType<TResult1, PromiseLike<TResult1>>, Null>, ?onrejected:haxe.extern.EitherType<Dynamic -> haxe.extern.EitherType<TResult2, PromiseLike<TResult2>>, Null>, ?onprogress:TProgress -> Void):Promise<haxe.extern.EitherType<TResult1, TResult2>, TProgress>;
// 	function done(?onfulfilled:T -> Void, ?onrejected:Dynamic -> Void, ?onprogress:TProgress -> Void):Void;
// 	function cancel():Void;
// 	@:overload(function(value:Undefined):Promise<Undefined> { })
// 	@:overload(function<T>(value:PromiseLike<T>):PromiseLike<T> { })
// 	@:overload(function<T, SomePromise:(PromiseLike<T>)>(value:SomePromise):SomePromise { })
// 	@:overload(function<T>(value:T):Promise<T> { })
// 	static function as(value:Null):Promise<Null>;
// 	static function is(value:Dynamic):Value;
// 	var PromiseLike : Dynamic;
// 	static function timeout(delay:Float):Promise<Void>;
// 	@:overload(function<T>(promises:Array<haxe.extern.EitherType<T, PromiseLike<T>>>):Promise<Array<T>> { })
// 	@:overload(function<T>(promises:{ }):Promise<{ }> { })
// 	static function join<T1, T2>(promises:Array<Dynamic>):Promise<Array<Dynamic>>;
// 	static function any<T>(promises:Array<haxe.extern.EitherType<T, PromiseLike<T>>>):Promise<{ var key : String; var value : Promise<T>; }>;
// 	static function wrap<T>(value:haxe.extern.EitherType<T, PromiseLike<T>>):Promise<T>;
// 	static function wrapError<T>(error:Error):Promise<T>;
// }
extern class CancellationTokenSource {
	var readonly : Dynamic;
	var token : CancellationToken;
	function cancel():Void;
	function dispose():Void;
}
typedef CancellationToken = {
	var readonly : Dynamic;
	var isCancellationRequested : Bool;
	var onCancellationRequested : IEvent<Dynamic>;
};
extern class Uri {
	static function isUri(thing:Dynamic):Dynamic;//Thing;
	var is : Dynamic;
	var Uri : Dynamic;
	var readonly : Dynamic;
	var scheme : String;
	var authority : String;
	var path : String;
	var query : String;
	var fragment : String;
	var fsPath : String;
	function with(change:{ @:optional
	var scheme : String; @:optional
	var authority : String; @:optional
	var path : String; @:optional
	var query : String; @:optional
	var fragment : String; }):Uri;
	static function parse(value:String):Uri;
	static function file(path:String):Uri;
	static function from(components:{ @:optional
	var scheme : String; @:optional
	var authority : String; @:optional
	var path : String; @:optional
	var query : String; @:optional
	var fragment : String; }):Uri;
	function toString(?skipEncoding:Bool):String;
	function toJSON():Dynamic;
	static function revive(data:haxe.extern.EitherType<UriComponents, Dynamic>):Uri;
}
typedef UriComponents = {
	var scheme : String;
	var authority : String;
	var path : String;
	var query : String;
	var fragment : String;
};
@:enum abstract KeyCode(Int) {
	var Unknown = 0;
	var Backspace = 1;
	var Tab = 2;
	var Enter = 3;
	var Shift = 4;
	var Ctrl = 5;
	var Alt = 6;
	var PauseBreak = 7;
	var CapsLock = 8;
	var Escape = 9;
	var Space = 10;
	var PageUp = 11;
	var PageDown = 12;
	var End = 13;
	var Home = 14;
	var LeftArrow = 15;
	var UpArrow = 16;
	var RightArrow = 17;
	var DownArrow = 18;
	var Insert = 19;
	var Delete = 20;
	var KEY_0 = 21;
	var KEY_1 = 22;
	var KEY_2 = 23;
	var KEY_3 = 24;
	var KEY_4 = 25;
	var KEY_5 = 26;
	var KEY_6 = 27;
	var KEY_7 = 28;
	var KEY_8 = 29;
	var KEY_9 = 30;
	var KEY_A = 31;
	var KEY_B = 32;
	var KEY_C = 33;
	var KEY_D = 34;
	var KEY_E = 35;
	var KEY_F = 36;
	var KEY_G = 37;
	var KEY_H = 38;
	var KEY_I = 39;
	var KEY_J = 40;
	var KEY_K = 41;
	var KEY_L = 42;
	var KEY_M = 43;
	var KEY_N = 44;
	var KEY_O = 45;
	var KEY_P = 46;
	var KEY_Q = 47;
	var KEY_R = 48;
	var KEY_S = 49;
	var KEY_T = 50;
	var KEY_U = 51;
	var KEY_V = 52;
	var KEY_W = 53;
	var KEY_X = 54;
	var KEY_Y = 55;
	var KEY_Z = 56;
	var Meta = 57;
	var ContextMenu = 58;
	var F1 = 59;
	var F2 = 60;
	var F3 = 61;
	var F4 = 62;
	var F5 = 63;
	var F6 = 64;
	var F7 = 65;
	var F8 = 66;
	var F9 = 67;
	var F10 = 68;
	var F11 = 69;
	var F12 = 70;
	var F13 = 71;
	var F14 = 72;
	var F15 = 73;
	var F16 = 74;
	var F17 = 75;
	var F18 = 76;
	var F19 = 77;
	var NumLock = 78;
	var ScrollLock = 79;
	var US_SEMICOLON = 80;
	var US_EQUAL = 81;
	var US_COMMA = 82;
	var US_MINUS = 83;
	var US_DOT = 84;
	var US_SLASH = 85;
	var US_BACKTICK = 86;
	var US_OPEN_SQUARE_BRACKET = 87;
	var US_BACKSLASH = 88;
	var US_CLOSE_SQUARE_BRACKET = 89;
	var US_QUOTE = 90;
	var OEM_8 = 91;
	var OEM_102 = 92;
	var NUMPAD_0 = 93;
	var NUMPAD_1 = 94;
	var NUMPAD_2 = 95;
	var NUMPAD_3 = 96;
	var NUMPAD_4 = 97;
	var NUMPAD_5 = 98;
	var NUMPAD_6 = 99;
	var NUMPAD_7 = 100;
	var NUMPAD_8 = 101;
	var NUMPAD_9 = 102;
	var NUMPAD_MULTIPLY = 103;
	var NUMPAD_ADD = 104;
	var NUMPAD_SEPARATOR = 105;
	var NUMPAD_SUBTRACT = 106;
	var NUMPAD_DECIMAL = 107;
	var NUMPAD_DIVIDE = 108;
	var KEY_IN_COMPOSITION = 109;
	var ABNT_C1 = 110;
	var ABNT_C2 = 111;
	var MAX_VALUE = 112;
}
extern class KeyMod {
	static var readonly : Dynamic;
	var CtrlCmd : Float;
	var Shift : Float;
	var Alt : Float;
	var WinCtrl : Float;
	static function chord(firstPart:Float, secondPart:Float):Float;
}
typedef IMarkdownString = {
	var value : String;
	@:optional
	var isTrusted : Bool;
};
typedef IKeyboardEvent = {
	var readonly : Dynamic;
	var browserEvent : js.html.KeyboardEvent;
	var target : js.html.Element;
	var ctrlKey : Bool;
	var shiftKey : Bool;
	var altKey : Bool;
	var metaKey : Bool;
	var keyCode : KeyCode;
	var code : String;
	function equals(keybinding:Float):Bool;
	function preventDefault():Void;
	function stopPropagation():Void;
};
typedef IMouseEvent = {
	var readonly : Dynamic;
	var browserEvent : js.html.MouseEvent;
	var leftButton : Bool;
	var middleButton : Bool;
	var rightButton : Bool;
	var target : js.html.Element;
	var detail : Float;
	var posx : Float;
	var posy : Float;
	var ctrlKey : Bool;
	var shiftKey : Bool;
	var altKey : Bool;
	var metaKey : Bool;
	var timestamp : Float;
	function preventDefault():Void;
	function stopPropagation():Void;
};
typedef IScrollEvent = {
	var readonly : Dynamic;
	var scrollTop : Float;
	var scrollLeft : Float;
	var scrollWidth : Float;
	var scrollHeight : Float;
	var scrollTopChanged : Bool;
	var scrollLeftChanged : Bool;
	var scrollWidthChanged : Bool;
	var scrollHeightChanged : Bool;
};
typedef IPosition = {
	var readonly : Dynamic;
	var lineNumber : Float;
	var column : Float;
};
extern class Position {
	var readonly : Dynamic;
	var lineNumber : Float;
	var column : Float;
	function new(lineNumber:Float, column:Float):Void;
	@:overload(function(a:IPosition, b:IPosition):Bool { })
	function equals(other:IPosition):Bool;
	@:overload(function(a:IPosition, b:IPosition):Bool { })
	function isBefore(other:IPosition):Bool;
	@:overload(function(a:IPosition, b:IPosition):Bool { })
	function isBeforeOrEqual(other:IPosition):Bool;
	static function compare(a:IPosition, b:IPosition):Float;
	function clone():Position;
	function toString():String;
	static function lift(pos:IPosition):Position;
	static function isIPosition(obj:Dynamic):Dynamic;//Obj;
	var is : Dynamic;
	var IPosition : Dynamic;
}
typedef IRange = {
	var readonly : Dynamic;
	var startLineNumber : Float;
	var startColumn : Float;
	var endLineNumber : Float;
	var endColumn : Float;
};
extern class Range {
	var readonly : Dynamic;
	var startLineNumber : Float;
	var startColumn : Float;
	var endLineNumber : Float;
	var endColumn : Float;
	function new(startLineNumber:Float, startColumn:Float, endLineNumber:Float, endColumn:Float):Void;
	@:overload(function(range:IRange):Bool { })
	function isEmpty():Bool;
	@:overload(function(range:IRange, position:IPosition):Bool { })
	function containsPosition(position:IPosition):Bool;
	@:overload(function(range:IRange, otherRange:IRange):Bool { })
	function containsRange(range:IRange):Bool;
	@:overload(function(a:IRange, b:IRange):Range { })
	function plusRange(range:IRange):Range;
	@:overload(function(a:IRange, b:IRange):Range { })
	function intersectRanges(range:IRange):Range;
	@:overload(function(a:IRange, b:IRange):Bool { })
	function equalsRange(other:IRange):Bool;
	function getEndPosition():Position;
	function getStartPosition():Position;
	function toString():String;
	function setEndPosition(endLineNumber:Float, endColumn:Float):Range;
	function setStartPosition(startLineNumber:Float, startColumn:Float):Range;
	@:overload(function(range:IRange):Range { })
	function collapseToStart():Range;
	static function fromPositions(start:IPosition, ?end:IPosition):Range;
	static function lift(range:IRange):Range;
	static function isIRange(obj:Dynamic):Dynamic;//Obj;
	var is : Dynamic;
	var IRange : Dynamic;
	static function areIntersectingOrTouching(a:IRange, b:IRange):Bool;
	static function compareRangesUsingStarts(a:IRange, b:IRange):Float;
	static function compareRangesUsingEnds(a:IRange, b:IRange):Float;
	static function spansMultipleLines(range:IRange):Bool;
}
typedef ISelection = {
	var readonly : Dynamic;
	var selectionStartLineNumber : Float;
	var selectionStartColumn : Float;
	var positionLineNumber : Float;
	var positionColumn : Float;
};
extern class Selection extends Range {
	// var readonly : Dynamic;
	var selectionStartLineNumber : Float;
	var selectionStartColumn : Float;
	var positionLineNumber : Float;
	var positionColumn : Float;
	function new(selectionStartLineNumber:Float, selectionStartColumn:Float, positionLineNumber:Float, positionColumn:Float):Void;
	function clone():Selection;
	override function toString():String;
	function equalsSelection(other:ISelection):Bool;
	static function selectionsEqual(a:ISelection, b:ISelection):Bool;
	function getDirection():SelectionDirection;
	override function setEndPosition(endLineNumber:Float, endColumn:Float):Selection;
	function getPosition():Position;
	override function setStartPosition(startLineNumber:Float, startColumn:Float):Selection;
	static function fromPositions(start:IPosition, ?end:IPosition):Selection;
	static function liftSelection(sel:ISelection):Selection;
	static function selectionsArrEqual(a:Array<ISelection>, b:Array<ISelection>):Bool;
	static function isISelection(obj:Dynamic):Dynamic;//Obj;
	// var is : Dynamic;
	var ISelection : Dynamic;
	static function createWithDirection(startLineNumber:Float, startColumn:Float, endLineNumber:Float, endColumn:Float, direction:SelectionDirection):Selection;
}
@:enum abstract SelectionDirection(Int) {
	var LTR = 0;
	var RTL = 1;
}
extern class Token {
	var _tokenBrand : Dynamic;
	var readonly : Dynamic;
	var offset : Float;
	var type : String;
	var language : String;
	function new(offset:Float, type:String, language:String):Void;
	function toString():String;
}

@:native("monaco")
extern class Monaco {
	static var editor:monaco.Editor;
	static var languages:monaco.Languages;
}