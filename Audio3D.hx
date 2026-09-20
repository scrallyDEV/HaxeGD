package haxegd;

import godot.*;

class Audio3D
{
    public static function doOneShot(stream:AudioStreamPlayer3D, audio:AudioStream)
    {
        stream.stream = audio;
        stream.play();
    }
}