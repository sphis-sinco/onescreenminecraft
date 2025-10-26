package sphis.onescrine.gameplay;

import flixel.FlxState;
import sphis.onescrine.gameplay.blocks.base.Block;

class PlayState extends FlxState
{
	override function create()
	{
		add(new Block('temp-block'));

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
