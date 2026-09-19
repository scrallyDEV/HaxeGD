package haxegd;

import godot.*;
import haxegd.TweenStyle;

class Tweening
{
    public static function makeTween(target:Node):Tween
    {
        return target.create_tween();
    }

    public static function doTween(target:Node, tween:Tween, property:String, value:Dynamic, style:TweenStyle = null, duration:Float = 1.0):Void
    {
        var changeProperty:NodePath = new NodePath(property);
        if (style == null) { style = TweenStyle.Linear; }
        
        tween.set_trans(cast style.transition);
        tween.set_ease(cast style.ease);
        tween.tween_property(target, changeProperty, value, duration);
        
    }
}