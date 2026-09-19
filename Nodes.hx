package haxegd;

import godot.*;

class Nodes
{
    public static function getNodeClass(node:Node3D):String // gets a Node's script class instead of Node's type class
    {
        var className:String;

        className = node.get_script().get_global_name();

        return className;
    }

    public static function getNodeFromRoot(node:String):Node // Gets a child Node of the scene's root node 
    {

        return Scenes.getRoot().get_node(node);
    }


    public static function getChildNode(parent:Node, child:String):Node // translation. gets a child node from a targeted parent
    {
        return parent.get_node(child);
    }

    public static function createChild(parent:Node, newNode:Node):Node // translation. creates a child to a targeted parent
    {
        parent.add_child(newNode);
        return newNode;
    }

    public static function removeNode(target:Node) // translation. removes a targeted node
    {
        target.queue_free();
    }
}