package sphis.onescrine;

import sphis.any.Version;
import sphis.onescrine.textvar.TextvarClass;

class Constants
{
	public static var TEXTVAR_CLASS:TextvarClass = new TextvarClass();

	public static var TITLE(get, never):String;

	static function get_TITLE():String
	{
		return TEXTVAR_CLASS.getVariable('title');
	}

	public static var VERSION(get, never):Version;

	static function get_VERSION():Version
	{
		final version_major = Std.int(TEXTVAR_CLASS.getVariable('version_major'));
		final version_minor = Std.int(TEXTVAR_CLASS.getVariable('version_minor'));
		final version_patch = Std.int(TEXTVAR_CLASS.getVariable('version_patch'));

		return new Version(version_major, version_minor, version_patch);
	}
}
