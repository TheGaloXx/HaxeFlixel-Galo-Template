<?xml version="1.0" encoding="utf-8"?>
<project xmlns="https://lime.software/project/1.0.2" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="https://lime.software/project/1.0.2 https://lime.software/xsd/project-1.0.2.xsd">

	<app title="${PROJECT_NAME}" file="${PROJECT_NAME}" main="Main" version="0.0.1"/>
	<app company="HaxeFlixel" unless="NO_FLXSAVE"/>

	<app preloader="flixel.system.FlxPreloader" />

	<window width="1280" height="720" fps="60" background="#ffffff" hardware="true" vsync="false" fullscreen="false" resizable="false" orientation="landscape"/>

	<set name="BUILD_DIR" value="export/debug" if="debug" />
	<set name="BUILD_DIR" value="export/release" unless="debug" />
	<set name="BUILD_DIR" value="export/32bit" if="32bit" />

	<source path="source" />
	<assets path="assets" />

	<haxedef name="FLX_NO_TOUCH"/>
	<haxedef name="FLX_NO_GAMEPAD" />
	<haxedef name="FLX_NO_FOCUS_LOST_SCREEN" /> <!-- this just disables the focus lost screen, not the game pause-->
	<haxedef name="FLX_NO_DEBUG" unless="debug" />
	<haxedef name="NAPE_RELEASE_BUILD" unless="debug" />
	
	<haxedef name="DISCORD_CLIENT" if="cpp"/>	<!-- delete this line to disable the Discord Rich Presence -->
	<haxedef name="CRASH_HANDLER" if="sys"/>	<!-- delete this line to disable the Crash handler -->
	<!--<haxedef name="NO_FLXSAVE"/>-->

	<!--<haxedef name="FLX_NO_MOUSE_ADVANCED" />-->
	<!--<haxedef name="FLX_NO_MOUSE"/>-->
	<!--<haxedef name="FLX_NO_KEYBOARD"/>-->
	<!--<haxedef name="FLX_NO_SOUND_TRAY" />-->
	<!--<haxedef name="FLX_NO_SOUND_SYSTEM" />-->

	<haxelib name="flixel" />
	<haxelib name="flixel-studio" if="debug"/>
	<!--<haxelib name="flixel-addons" />-->
	<!--<haxelib name="flixel-ui" />-->
	<haxelib name="discord_rpc" if="DISCORD_CLIENT"/>

	<assets path='extra/art' embed='true' if="windows"/>

	<icon path="extra/art/icon16.png" size='16'/>
	<icon path="extra/art/icon32.png" size='32'/>
	<icon path="extra/art/icon64.png" size='64'/>
	<icon path="extra/art/iconOG.png" size='600'/>
</project>
