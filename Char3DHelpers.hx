package haxegd;

import godot.*;

class Char3DHelpers
{
    public static function moveChar3D(target:CharacterBody3D):Void // translation
    {
        target.move_and_slide();
    }

    public static function isChar3DGrounded(target:CharacterBody3D):Bool // translation, also helpful for external scripts
    {
        return target.is_on_floor();
    }

    public static function getRaycastCollider(raycast:RayCast3D):{className:String, node:Node} // gets the name of the Class and the Node Type of a Node currently colliding with a provided Raycast
    {
        var object = raycast.get_collider();
        var className:String = "null";
        var node:Node = null;

        /*
        null checks here prevent crashing when getting a name of a script that doesn't exist on a target 
        in situations where there is no script or is no node
        DOES NOT PREVENT OBJECTS WITHOUT SCRIPTS FROM RETURNING A VALUE
        WILL RETURN NULL 
        */
        if (object != null && object.get_script() != null && Std.isOfType(object, Node)) { 
            className = object.get_script().get_global_name();
            node = cast object; 
        }
        
        return { className: className, node: node };
    }
}