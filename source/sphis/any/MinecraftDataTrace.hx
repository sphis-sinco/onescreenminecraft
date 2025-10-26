package sphis.any;

using StringTools;

class MinecraftDataTrace
{
	public static function convert_dynamic_data_to_minecraft(data:Dynamic):String
		return convert_string_data_to_minecraft(Std.string(data));

	public static function convert_string_data_to_minecraft(data:String):String
		return data.replace(' : ', '=').replace(': ', '=').replace('(', '{').replace(')', '}').replace(' | ', ', ');
}
