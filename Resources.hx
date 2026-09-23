package haxegd;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
#end

class Resources
{
    public static macro function preload(path:Expr):Expr
    {
        var value = switch (path.expr)
        {
            case EConst(CString(s)):
                s;

            default:
                Context.error("Resources.preload() requires a literal string path.", path.pos);
        }

        return macro untyped __gdscript__($v{'preload("' + value + '")'});
    }
}