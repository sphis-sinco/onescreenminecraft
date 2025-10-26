package sphis.onescrine.gameplay;

import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxRect;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import sphis.onescrine.gameplay.blocks.base.Block;
import tracedinpurple.ui.FlxScaledSliceSprite;

class PlayState extends FlxState
{
	override function create()
	{
		add(new Block('temp-block'));

		var ui_base_graphic = FlxGraphic.fromAssetKey('assets/images/gui/ui-base.png');
		var ui_base_corner_radius = 4;
		var ui_base_slice = new FlxRect(ui_base_corner_radius, ui_base_corner_radius, Std.int(ui_base_graphic.width / 2), Std.int(ui_base_graphic.height / 2));

		var taigo:FlxScaledSliceSprite = new FlxScaledSliceSprite(ui_base_graphic, ui_base_slice, Constants.UI_SCALE_MULTIPLIER,
			ui_base_slice.width * (Constants.UI_SCALE_MULTIPLIER * 1), ui_base_slice.height * Constants.UI_SCALE_MULTIPLIER);
		taigo.screenCenter();
		add(taigo);

		FlxTween.tween(taigo,
			{width: ui_base_slice.width * (Constants.UI_SCALE_MULTIPLIER * 8), height: ui_base_slice.height * (Constants.UI_SCALE_MULTIPLIER * 8)}, 1, {
				type: PINGPONG,
				onUpdate: t ->
				{
					// taigo.stretchAll();
					taigo.updatedSlicedHitbox();
				},
				ease: FlxEase.sineInOut
			});

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
