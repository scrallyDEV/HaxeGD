package haxegd;

import godot.*;

class Controls
{
    public static function inputPressed(action:String, isSecondary:Bool = false):Bool
    { // Mapping the InputPressed function to Godot's Input.is_action_pressed method
        if (isSecondary)
        {
            action += "-secondary";
        }
        return Input.is_action_pressed(action);
    }

    public static function inputJustPressed(action:String, isSecondary:Bool = false):Bool
    { // Mapping the InputPressed function to Godot's Input.is_action_just_pressed method
        if (isSecondary)
        {
            action += "-secondary";
        }
        return Input.is_action_just_pressed(action);
    }

    public static function physicalKeyPressed(keycode:godot.Key):Bool
    {
        return Input.is_physical_key_pressed(keycode);
    }

    public static function getMouseMovement(event:InputEvent):{pitch:Float, yaw:Float}
    {
        var yaw:Float = 0;
        var pitch:Float = 0;


        if (Std.isOfType(event, InputEventMouseMotion))
        {
            var dir:InputEventMouseMotion = cast event; 

            yaw = -dir.screen_relative.x;
            pitch = -dir.screen_relative.y;
        }


        return {
            pitch: pitch,
            yaw: yaw
        };
    }

    public static function mouseCapture(isLocked:Bool):Void
    {
        var mode = cast (isLocked ? Input_MouseMode.MOUSE_MODE_CAPTURED : Input_MouseMode.MOUSE_MODE_VISIBLE);
        
        
        Input.mouse_mode = mode;
    }
}