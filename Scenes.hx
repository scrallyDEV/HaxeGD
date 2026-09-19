package haxegd;

import godot.*;

class Scenes
{
    public static function getRoot():Node // Gets the root node of the currently loaded scene
    {
        var tree:SceneTree = cast Engine.get_main_loop();
        var scene:Node = tree.current_scene;
        return scene;
    } // arguably the single most helpful helper

    public static function reloadScene():Void
    {
        getRoot().get_tree().reload_current_scene();
    }

    public static function exitGame():Void // exits the game in the context of the scenes root node
    {
        getRoot().get_tree().quit();
    }
}