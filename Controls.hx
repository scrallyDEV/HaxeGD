package haxegd;

import godot.*;

class Controls
{
    public static function inputPressed(action:String, isSecondary:Bool = false):Bool
    {
        if (isSecondary)
        {
            action += "-secondary";
        }
        return Input.is_action_pressed(action);
    }

    public static function inputJustPressed(action:String, isSecondary:Bool = false):Bool
    { 
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

    public static function isMouseInput(event:InputEvent, input:String):Bool
    {
        input = input.toLowerCase();

        if (Std.isOfType(event, InputEventMouseButton)) {
            var mouseEvent:InputEventMouseButton = cast event;

            if (!mouseEvent.pressed) {
                return false;
            }

            return switch(input)
            {
                case "left": mouseEvent.button_index == (cast MouseButton.MOUSE_BUTTON_LEFT : Int);
                case "right": mouseEvent.button_index == (cast MouseButton.MOUSE_BUTTON_RIGHT : Int);
                case "middle": mouseEvent.button_index == (cast MouseButton.MOUSE_BUTTON_MIDDLE : Int);
                default:
                    trace("HAXEGD: " + input + "" + "is not a valid mouse button");
                    return false;
            }
        }
        else {
            return false;
        }
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