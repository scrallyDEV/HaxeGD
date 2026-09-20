package haxegd;

import godot.*;

class Audio 
{
    public static function doOneShot(stream:AudioStreamPlayer, audio:AudioStream)
    {
        stream.stream = audio;
        stream.play();
    }

    public static function setPolyphony(stream:AudioStreamPlayer, maxConcurrent = 1)
    {
        stream.max_polyphony = maxConcurrent;
    }
}