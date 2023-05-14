package;

class Paths
{
    public static function file(file:String, ?library:String):String
    {
        return 'assets/$library/$file';
    }

    public static function image(key:String, library:String = 'shared'):String
    {
        return 'assets/$library/images/$key.png';
    }

    public static function music(key:String, library:String = 'shared'):String
    {
        return 'assets/$library/music/$key.ogg';
    }

    public static function sound(key:String, library:String = 'shared'):String
    {
        return 'assets/$library/sounds/$key.ogg';
    }

    /**
			 * Function that returns a font path.
			 * @param   key   The font name (REMEMBER TO ADD THE FONT EXTENSION).
    **/
    
    public static function font(key:String):String
    {
        return 'assets/game/fonts/$key';
    }

    public static function getSparrowAtlas(key:String, ?library:String)
    {
        return flixel.graphics.frames.FlxAtlasFrames.fromSparrow(image(key, library), file('images/$key.xml', library));
    }
}