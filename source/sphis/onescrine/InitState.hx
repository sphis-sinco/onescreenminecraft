package sphis.onescrine;

import flixel.FlxG;
import flixel.FlxState;
import sphis.onescrine.textvar.Textvar;

class InitState extends FlxState
{
	override public function create()
	{
		Textvar.file_names.push('config/version');
		Textvar.file_names.push('config/ui');
		Textvar.file_names.push('config/save');
		Textvar.parseAllFiles(true);

		trace(Constants.TITLE);
		trace('v' + Constants.VERSION);

		FlxG.switchState(() -> new sphis.onescrine.gameplay.PlayState());

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
