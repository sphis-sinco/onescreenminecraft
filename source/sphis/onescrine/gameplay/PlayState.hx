package sphis.onescrine.gameplay;

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

			width_scale_addition: 16,
			height_scale_addition: 4
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
