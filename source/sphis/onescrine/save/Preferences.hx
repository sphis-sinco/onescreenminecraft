package sphis.onescrine.save;

import sphis.onescrine.textvar.Textvar;

class Preferences
{
	public static var UI_DARK(get, never):Bool;

	static function get_UI_DARK():Bool
	{
		return (Std.string(Textvar.getVariable('ui_dark')).toLowerCase() == 'true') ?? false;
	}
}
