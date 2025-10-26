package sphis.onescrine.gameplay;

import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxRect;
import sphis.onescrine.gameplay.blocks.base.Block;
import tracedinpurple.ui.FlxScaledSliceSprite;

class PlayState extends FlxState
{
	override function create()
	{
		add(new Block('temp-block'));

		var ui_base_graphic = FlxGraphic.fromAssetKey('assets/images/gui/ui-base.png');
		var ui_base_slice = new FlxRect(0, 0, 16, 16);

		var taigo:FlxScaledSliceSprite = new FlxScaledSliceSprite(ui_base_graphic, ui_base_slice, Constants.UI_SCALE_MULTIPLIER,
			ui_base_slice.width * (Constants.UI_SCALE_MULTIPLIER * 2), ui_base_slice.height * Constants.UI_SCALE_MULTIPLIER);
		taigo.screenCenter();
		add(taigo);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
