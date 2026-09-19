package haxegd;

#if macro

import haxe.macro.Context;
import haxe.macro.Expr;

class GodotTweens
{
    public static function TweenStyleBuild():Array<Field>
    {
        var fields = Context.getBuildFields();
        var pos = Context.currentPos();

        // Godot Tween TransitionType values.
        // Linear is handled separately because its ease mode
        // makes no difference.
        var transitions = [
            { name: "Sine",    value: 1 },
            { name: "Quint",   value: 2 },
            { name: "Quart",   value: 3 },
            { name: "Quad",    value: 4 },
            { name: "Expo",    value: 5 },
            { name: "Elastic", value: 6 },
            { name: "Cubic",   value: 7 },
            { name: "Circ",    value: 8 },
            { name: "Bounce",  value: 9 },
            { name: "Back",    value: 10 },
            { name: "Spring",  value: 11 }
        ];

        // Godot Tween EaseType values.
        var eases = [
            { name: "In",    value: 0 },
            { name: "Out",   value: 1 },
            { name: "InOut", value: 2 },
            { name: "OutIn", value: 3 }
        ];

        // --------------------------------------------------
        // LINEAR
        // --------------------------------------------------
        //
        // LinearIn / LinearOut / LinearInOut / LinearOutIn
        // would all behave identically, so HaxeGD exposes
        // only TweenStyle.Linear.
        //
        // transition = 0 -> TRANS_LINEAR
        // ease       = 0 -> EASE_IN (irrelevant for linear)

        fields.push({
            name: "Linear",
            access: [APublic, AStatic],
            kind: FProp(
                "get",
                "never",
                macro : TweenStyle
            ),
            pos: pos
        });

        fields.push({
            name: "get_Linear",
            access: [AStatic],
            kind: FFun({
                args: [],
                ret: macro : TweenStyle,
                expr: macro {
                    return cast {
                        transition: 0,
                        ease: 0
                    };
                }
            }),
            pos: pos
        });

        // --------------------------------------------------
        // ALL OTHER TRANSITIONS
        // --------------------------------------------------

        for (transition in transitions)
        {
            for (ease in eases)
            {
                var styleName = transition.name + ease.name;
                var getterName = "get_" + styleName;

                var transitionValue = transition.value;
                var easeValue = ease.value;

                // Generates:
                //
                // public static var QuadOut(get, never):TweenStyle;

                fields.push({
                    name: styleName,
                    access: [APublic, AStatic],
                    kind: FProp(
                        "get",
                        "never",
                        macro : TweenStyle
                    ),
                    pos: pos
                });

                // Generates:
                //
                // static function get_QuadOut():TweenStyle
                // {
                //     return cast {
                //         transition: 4,
                //         ease: 1
                //     };
                // }

                fields.push({
                    name: getterName,
                    access: [AStatic],
                    kind: FFun({
                        args: [],
                        ret: macro : TweenStyle,
                        expr: macro {
                            return cast {
                                transition: $v{transitionValue},
                                ease: $v{easeValue}
                            };
                        }
                    }),
                    pos: pos
                });
            }
        }

        return fields;
    }
}

#end