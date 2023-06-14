package substates;

import flixel.FlxG;

class Start extends flixel.FlxState
{
	override function create()
	{
		#if debug
		saveCompiles();

		#if (!FLX_NO_SOUND_TRAY && !FLX_NO_SOUND_SYSTEM)
		FlxG.sound.volumeUpKeys = [PLUS, Q];
		#end
		#end

		#if DISCORD_CLIENT
		Discord.DiscordClient.initialize();
		Utils.presence('Playing', 'test', 'x');
		#end

		Utils.title(null);

		// flixel.system.FlxAssets.FONT_DEFAULT = Paths.font('Storytime.ttf', PRELOAD);
		FlxG.worldBounds.set(0, 0);
		flixel.FlxSprite.defaultAntialiasing = true;

		#if (!FLX_NO_SOUND_TRAY && !FLX_NO_SOUND_SYSTEM)
		FlxG.sound.muted = false;
		FlxG.sound.volume = 1;
		#end

		#if !FLX_NO_MOUSE
		FlxG.mouse.visible = FlxG.mouse.enabled = FlxG.mouse.useSystemCursor = true;
		#end

		FlxG.signals.preStateSwitch.add(function()
		{
			// FlxG.bitmap.dumpCache();
		});

		FlxG.signals.postStateSwitch.add(function()
		{
			//
		});

		lime.app.Application.current.onExit.add(function(exitCode)
		{
			#if DISCORD_CLIENT
			Discord.DiscordClient.shutdown();
			#end

			#if sys
			Sys.exit(1);
			#else
			openfl.system.System.exit(1);
			#end
		});

		FlxG.switchState(new menus.PlayState());

		super.create();
	}

	private function saveCompiles():Void
	{
		#if sys
		var compiles:Int = 0;

		var cwd = haxe.io.Path.normalize(Sys.getCwd());
		var thePath = StringTools.replace(cwd, 'export/debug/${getTarget()}/bin', '') + 'compiles.galo';

		trace('Path exists: ${sys.FileSystem.exists(thePath)}.');

		if (sys.FileSystem.exists(thePath))
			compiles = Std.parseInt(sys.io.File.getContent(thePath));

		sys.io.File.saveContent(thePath, Std.string(compiles + 1));
		#else
		trace('Target is not compatible to save compiles!');
		#end
	}

	private function getTarget():String
	{
		var target:String = '';

		#if python
		target = 'python';
		#elseif java
		target = 'java';
		#elseif cs
		target = 'cs';
		#elseif cpp
		target = 'cpp';
		#elseif php
		target = 'php';
		#elseif macro
		target = 'macro';
		#elseif lua
		target = 'lua';
		#elseif hl
		target = 'hl';
		#elseif neko
		target = 'neko';
		#end

		return target;
	}
}
