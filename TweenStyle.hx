package haxegd;

import godot.*;

typedef TweenType = {
    var transition:Int;
    var ease:Int;
}

@:forward
@:build(haxegd.GodotTweens.TweenStyleBuild())
abstract TweenStyle(TweenType)
{
}