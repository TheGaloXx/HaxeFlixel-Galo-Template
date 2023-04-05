package;

using StringTools;

class Utils
{
	/**
			 * Function that changes the `Discord Rich Presence`.
			 * @param   state   The second line in the presence (use it for info).
			 * @param   details   The first line in the presence (use for current state and details).
			 * @param   hasStartTimestamp      Time left indicator (ignore).
			 * @param   endTimestamp     End time indicator (ignore).
             * @param   smallImageKey The small image name.
    **/

	public static function presence(state:String, details:String, ?hasStartTimestamp:Bool, ?endTimestamp:Float, smallImageKey:String, addLittleIcon:Bool = false)
	{
        #if DISCORD_CLIENT
		Discord.DiscordClient.changePresence(state, details, hasStartTimestamp, endTimestamp, smallImageKey, addLittleIcon);
        #end
	}

    public static function firstLetterUpperCase(string:String):String 
        {
			var firstLetter = string.charAt(0).toUpperCase();
			var restString = string.substring(1, string.length);
			var resultString = firstLetter + restString;
            return resultString.replace('-', ' ');
        }

	public static function title(state:String, deleteAppTitle:Bool = false)
	{
		var daTitle:String = "";
		if (!deleteAppTitle)
			daTitle = Main.appTitle;

		if (state == null || state == "")
			lime.app.Application.current.window.title = daTitle;
		else
			lime.app.Application.current.window.title = ('$daTitle - $state');
	}
}


