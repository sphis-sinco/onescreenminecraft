package sphis.onescrine.ui;

import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import tracedinpurple.ui.FlxScaledSliceSprite;

typedef ScaledUIBoxParameters =
{
	var position:FlxPoint;

	var ?general_scale_addition:Int;
	var ?width_scale_addition:Int;
	var ?height_scale_addition:Int;
}

class ScaledUIBox extends FlxScaledSliceSprite
{
	override public function new(params:ScaledUIBoxParameters)
	{
		var ui_base_graphic = FlxGraphic.fromAssetKey('assets/images/gui/ui-base.png');
		var ui_base_corner_radius = 4;
		var ui_base_slice = new FlxRect(ui_base_corner_radius, ui_base_corner_radius, Std.int(ui_base_graphic.width / 2), Std.int(ui_base_graphic.height / 2));

		super(ui_base_graphic, ui_base_slice, Constants.UI_SCALE_MULTIPLIER + (params.general_scale_addition - 1),
			ui_base_slice.width * (Constants.UI_SCALE_MULTIPLIER + params.general_scale_addition + params.width_scale_addition),
			ui_base_slice.height * (Constants.UI_SCALE_MULTIPLIER + params.general_scale_addition + params.height_scale_addition));

		this.setPosition(params.position.x, params.position.y);
	}
}
