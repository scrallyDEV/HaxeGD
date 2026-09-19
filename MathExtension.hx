package haxegd;

import godot.Vector3;

class MathExtension
{
    public static function normalizeVector3(vector:Vector3):Vector3
    {
        if (vector != Vector3.ZERO) { 
            vector = vector.normalized(); 
        }

        return vector;
    }

    public static function clamp(target:Float, min:Float, max:Float):Float // Int can be passed through to Float, important to note this does not apply in reverse
    {
        if (target > max) {target = max;} // if above, is now max
        else if (target < min) {target = min;} // if below, is now min
        else {} // not necessary but its good here for implicity, if neither, do nothing
        return target;
    }

    public static function degreesToRadians(target:Float):Float
    {
        target = target * Math.PI / 180;
        return target;
    }

    public static function countTowards(currentVal:Float, targetVal:Float, amountVal:Float):Float
    {   
        if (amountVal <= 0) {
            trace("MathWrapper fallback: Attempting to increase an amount by a negative number or 0");
            trace("MathWrapper fallback: Amount should be greater than 0");
            return currentVal;
        }
        if (currentVal < targetVal) {
            currentVal = currentVal + amountVal;

            if (currentVal > targetVal) { currentVal = targetVal; }
        }
        else if (currentVal > targetVal) {
            currentVal = currentVal - amountVal;
            
            if (currentVal < targetVal) { currentVal = targetVal; }
        }

        return currentVal;
    }

    public static function isTolerableDifference(valueA:Float, valueB:Float, tolerance:Float = 0.0001):Bool // For floating point precision problems. just google it its not a terribly complex concept
    { // default tolerance is usually enough, adding as a param in case it needs morphing
        if (Math.abs(valueA - valueB) <= tolerance) // checks if the numbers are "effectively" the same
        {
            return true;
        }
        else {
            return false;
        }
    }
}