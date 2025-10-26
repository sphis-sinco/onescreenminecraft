package sphis.onescrine;

import flixel.FlxG;
import flixel.FlxState;
import sphis.onescrine.textvar.Textvar;

class InitState extends FlxState
{
	override public function create()
	{
		Textvar.file_names.push('config/blocks');
		Textvar.file_names.push('config/save');
		Textvar.file_names.push('config/ui');
		Textvar.file_names.push('config/version');
		Textvar.file_names.push('config/world');
		Textvar.parseAllFiles(true);

		trace(Constants.TITLE);
		trace('v' + Constants.VERSION);
		for (key => value in Textvar.variables)
		{
			trace(key + '=' + value);
		};

		FlxG.switchState(() -> new sphis.onescrine.gameplay.PlayState());

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
