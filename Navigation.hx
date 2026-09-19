package haxegd;

import godot.*;

class Navigation
{
    public static function getGlobalPosition(target:Node3D):Vector3 // translation.
    {
        return target.global_position; // do not use node to calculate global pos in a Vector3, use Vector2 in a 2D game obviously :) 
    }

    public static function getDirectionTo(caller:Node3D, target:Node3D):Vector3
    {
        return getGlobalPosition(caller).direction_to(getGlobalPosition(target));
    }

    public static function getDistanceTo(caller:Vector3, target:Vector3):Float // translation.
    {
        return caller.distance_to(target);
    }

    public static function lookAt(target:Node3D, position:Vector3) // translation.
    {
        target.look_at(position, Vector3.UP);
    }
}