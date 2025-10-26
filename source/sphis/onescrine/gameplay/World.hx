package sphis.onescrine.gameplay;

import sphis.onescrine.textvar.Textvar;

class World
{
	public static var BACKDROP_BLOCK(get, never):String;

	static function get_BACKDROP_BLOCK():String
		return Textvar.getVariable('world_backdrop_block') ?? 'sky_block';

	public static var LAYERS(get, never):Int;

	static function get_LAYERS():Int
		return Std.int(Textvar.getVariable('world_layers') ?? 1);

	public static function getLayerBlock(layer:Int):String
		return Textvar.getVariable('world_layer_' + Std.string(layer) + '_block') ?? null;

	public static function getLayerHeight(layer:Int):Int
		return Std.int(Textvar.getVariable('world_layer_' + Std.string(layer) + '_y')) ?? 0;

	public static function getLayerRandomHeight(layer:Int):Int
		return Std.int(Textvar.getVariable('world_layer_' + Std.string(layer) + '_y_random_max_amount')) ?? 0;
}
