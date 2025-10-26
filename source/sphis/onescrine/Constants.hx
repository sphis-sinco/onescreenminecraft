package sphis.onescrine;

import sphis.any.Version;
import sphis.onescrine.textvar.TextvarClass;

class Constants
{
	public static var TEXTVAR_CLASS:TextvarClass = new TextvarClass();

	public static var TITLE(get, never):String;

	static function get_TITLE():String
		return TEXTVAR_CLASS.getVariable('title');

	public static var VERSION(get, never):Version;

	static function get_VERSION():Version
	{
		final version_major = Std.int(TEXTVAR_CLASS.getVariable('version_major') ?? 0);
		final version_minor = Std.int(TEXTVAR_CLASS.getVariable('version_minor') ?? 0);
		final version_patch = Std.int(TEXTVAR_CLASS.getVariable('version_patch') ?? 0);

		return new Version(version_major, version_minor, version_patch);
	}

	public static var UI_SCALE_MULTIPLIER(get, never):Int;

	static function get_UI_SCALE_MULTIPLIER():Int
		return TEXTVAR_CLASS.getVariable('ui_scale_multiplier') ?? 4;

	public static var BLOCK_SCALE_MULTIPLIER(get, never):Int;

	static function get_BLOCK_SCALE_MULTIPLIER():Int
		return TEXTVAR_CLASS.getVariable('block_scale_multiplier') ?? 4;

	public static var BLOCK_DEFAULT_WIDTH(get, never):Int;

	static function get_BLOCK_DEFAULT_WIDTH():Int
		return TEXTVAR_CLASS.getVariable('block_default_width') ?? 16;

	public static var BLOCK_DEFAULT_HEIGHT(get, never):Int;

	static function get_BLOCK_DEFAULT_HEIGHT():Int
		return TEXTVAR_CLASS.getVariable('block_default_height') ?? 16;
}
