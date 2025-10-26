package sphis.onescrine.save;

import sphis.onescrine.textvar.Textvar;

class Preferences
{
	public static var UI_DARK(get, never):Bool;

	static function get_UI_DARK():Bool
	{
		return (Textvar.getVariable('ui_dark') == 'true') ?? false;
	}
}
