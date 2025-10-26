package sphis.onescrine.gameplay;

import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxPoint;
import sphis.onescrine.gameplay.blocks.base.Block;
import sphis.onescrine.ui.ScaledUIBox;

class PlayState extends FlxState
{
	override function create()
	{
		add(new Block('temp-block'));

		var taigo:ScaledUIBox = new ScaledUIBox({
			position: FlxPoint.get(),

			width_scale_addition: FlxG.random.int(0, 32),
			height_scale_addition: FlxG.random.int(0, 32),
		});
		taigo.screenCenter();
		add(taigo);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
