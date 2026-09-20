package haxegd;

import godot.*;

class Audio 
{
    public static function doOneShot(stream:AudioStreamPlayer, audio:AudioStream)
    {
        stream.stream = audio;
        stream.play();
    }
}