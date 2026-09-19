package haxegd;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;

class GodotCallbacks
{
    public static function build():Array<Field>
    {
        var fields = Context.getBuildFields();

        var hasOnReady:Bool = false;
        var hasOnUpdate:Bool = false;
        var hasOnPhysicsUpdate:Bool = false;
        var hasOnInput:Bool = false;
        var hasOnUnhandledInput:Bool = false;

        var hasGodotReady:Bool = false;
        var hasGodotUpdate:Bool = false;
        var hasGodotPhysicsUpdate:Bool = false;
        var hasGodotInput:Bool = false;
        var hasGodotUnhandledInput:Bool = false;

        // See which cooked and raw callbacks this class already contains.
        for (field in fields)
        {
            switch (field.name)
            {
                case "onReady":
                    hasOnReady = true;

                case "onUpdate":
                    hasOnUpdate = true;

                case "onPhysicsUpdate":
                    hasOnPhysicsUpdate = true;

                case "onInput":
                    hasOnInput = true;

                case "onUnhandledInput":
                    hasOnUnhandledInput = true;

                case "_ready":
                    hasGodotReady = true;

                case "_process":
                    hasGodotUpdate = true;

                case "_physics_process":
                    hasGodotPhysicsUpdate = true;

                case "_input":
                    hasGodotInput = true;

                case "_unhandled_input":
                    hasGodotUnhandledInput = true;
            }
        }


        // onReady() -> _ready()
        if (hasOnReady && !hasGodotReady)
        {
            fields.push({
                name: "_ready",
                access: [APublic, AOverride],
                kind: FFun({
                    args: [],
                    ret: macro : Void,
                    expr: macro
                    {
                        onReady();
                    }
                }),
                pos: Context.currentPos()
            });
        }


        // onUpdate(delta) -> _process(delta)
        if (hasOnUpdate && !hasGodotUpdate)
        {
            fields.push({
                name: "_process",
                access: [APublic, AOverride],
                kind: FFun({
                    args: [
                        {
                            name: "delta",
                            type: macro : Float
                        }
                    ],
                    ret: macro : Void,
                    expr: macro
                    {
                        onUpdate(delta);
                    }
                }),
                pos: Context.currentPos()
            });
        }


        // onPhysicsUpdate(delta) -> _physics_process(delta)
        if (hasOnPhysicsUpdate && !hasGodotPhysicsUpdate)
        {
            fields.push({
                name: "_physics_process",
                access: [APublic, AOverride],
                kind: FFun({
                    args: [
                        {
                            name: "delta",
                            type: macro : Float
                        }
                    ],
                    ret: macro : Void,
                    expr: macro
                    {
                        onPhysicsUpdate(delta);
                    }
                }),
                pos: Context.currentPos()
            });
        }


        // onInput(event) -> _input(event)
        if (hasOnInput && !hasGodotInput)
        {
            fields.push({
                name: "_input",
                access: [APublic, AOverride],
                kind: FFun({
                    args: [
                        {
                            name: "event",
                            type: macro : godot.InputEvent
                        }
                    ],
                    ret: macro : Void,
                    expr: macro
                    {
                        onInput(event);
                    }
                }),
                pos: Context.currentPos()
            });
        }


        // onUnhandledInput(event) -> _unhandled_input(event)
        if (hasOnUnhandledInput && !hasGodotUnhandledInput)
        {
            fields.push({
                name: "_unhandled_input",
                access: [APublic, AOverride],
                kind: FFun({
                    args: [
                        {
                            name: "event",
                            type: macro : godot.InputEvent
                        }
                    ],
                    ret: macro : Void,
                    expr: macro
                    {
                        onUnhandledInput(event);
                    }
                }),
                pos: Context.currentPos()
            });
        }


        return fields;
    }
}
#end