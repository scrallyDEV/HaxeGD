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

    public static function getNodeName(node:Node):String
    {
        return cast node.get_name();
    }

    public static function getNodeFromRoot(node:String):Node // Gets a child Node of the scene's root node 
    {

        return Scenes.getRoot().get_node(node);
    }


    public static function getChildNode(parent:Node, child:String):Node // translation. gets a child node from a targeted parent
    {
        return parent.get_node(child);
    }

        public static function getParentNode(child:Node):Node // translation. gets a parent node from a child
    {
        return child.get_parent();
    }

    public static function createChild(parent:Node, newNode:Node):Node // translation. creates a child to a targeted parent
    {
        parent.add_child(newNode);
        return newNode;
    }

    public static function removeNode(target:Node):Void // translation. removes a targeted node
    {
        target.queue_free();
    }

    public static function nodeHasMethod(target:Node, method:String):Bool
    {
        return target.has_method(method);
    }
}

class ControlNodes
{
    public static function toggleOffsetTransform(target:Control, value:Bool):Void
    {
        target.offset_transform_enabled = value;
    }

    public static function offsetTransformPosition(target:Control, x:Float, y:Float):Void
    {
        target.offset_transform_position.x = x;
        target.offset_transform_position.y = y;
    }

    public static function offsetPivot(target:Control, x:Float, y:Float):Void
    {
        target.pivot_offset.x = x;
        target.pivot_offset.y = y;
    }
    
    public static function anchor(target:Control, anchor:String = "topleft", keepOffsets:Bool = true):Void
    {
        var preset:Control_LayoutPreset;
        anchor = anchor.toLowerCase();

        switch(anchor)
        {
            case "topleft":
                preset = PRESET_TOP_LEFT;
            case "top":
                preset = PRESET_CENTER_TOP;
            case "topright":
                preset = PRESET_TOP_RIGHT;
            case "left":
                preset = PRESET_CENTER_LEFT;
            case "middle":
                preset = PRESET_CENTER;
            case "right":
                preset = PRESET_CENTER_RIGHT;
            case "bottomleft":
                preset = PRESET_BOTTOM_LEFT;
            case "bottom":
                preset = PRESET_CENTER_BOTTOM;
            case "bottomright":
                preset = PRESET_BOTTOM_RIGHT;
            default:
                trace("HAXEGD: " + anchor + ": " + "is not a valid anchor preset");
                return;
        }
        target.layout_mode = 1;
        target.set_anchors_preset(preset, keepOffsets);
    }

    public static function setTexture(target:Control, texture:Texture2D):Void
    {
        if (target.has_method("set_texture")) {
            var args = new GodotArray();
            args.push_back(texture);
            target.callv("set_texture", args);
        }
        else {
            trace("HAXEGD: Target cannot contain a texture");
        }
    }

    public static function setScale(target:Control, x:Float, y:Float):Void
    {
        var vec2:Vector2 = new Vector2(x, y);

        target.set_offset_transform_scale(vec2);
    }

    public static function setAlpha(target:Control, value:Float):Void
    {
        target.modulate.a = value;
    }
}