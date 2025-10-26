package sphis.onescrine.gameplay;

import sphis.onescrine.textvar.Textvar;

class World
{
	public static var LAYERS(get, never):Int;

	static function get_LAYERS():Int
	{
		return Std.int(Textvar.getVariable('world_layers') ?? 4);
	}

	public static function getLayerBlock(layer:Int):String
		return Textvar.getVariable('world_layer_' + Std.string(layer) + '_block') ?? 'temp-block';

	public static function getLayerHeight(layer:Int):Int
		return Textvar.getVariable('world_layer_' + Std.string(layer) + '_y') ?? 0;
}
