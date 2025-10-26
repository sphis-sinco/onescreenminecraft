package sphis.onescrine.ui;

import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import tracedinpurple.ui.FlxScaledSliceSprite;

class ScaledUIBox extends FlxScaledSliceSprite
{
	override public function new(position:FlxPoint, general_scale_addition:Int = 0, width_scale_addition:Int = 0, height_scale_addition:Int = 0)
	{
		var ui_base_graphic = FlxGraphic.fromAssetKey('assets/images/gui/ui-base.png');
		var ui_base_corner_radius = 4;
		var ui_base_slice = new FlxRect(ui_base_corner_radius, ui_base_corner_radius, Std.int(ui_base_graphic.width / 2), Std.int(ui_base_graphic.height / 2));

		super(ui_base_graphic, ui_base_slice, Constants.UI_SCALE_MULTIPLIER + (general_scale_addition - 1),
			ui_base_slice.width * (Constants.UI_SCALE_MULTIPLIER + general_scale_addition + width_scale_addition),
			ui_base_slice.height * (Constants.UI_SCALE_MULTIPLIER + general_scale_addition + height_scale_addition));

		this.setPosition(position.x, position.y);
	}
}
