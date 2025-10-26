package sphis.onescrine.textvar;

import lime.utils.Assets;

class Textvar
{
	public static var file_names:Array<String> = [];
	public static var variables:Map<String, Dynamic> = [];

	public static function setVariable(variable:String, value:Dynamic)
	{
		variables.set(variable, value);
	}

	public static function getVariable(variable:String):Dynamic
	{
		return variables.get(variable);
	}

	public static function parseAllFiles(allow_unknown_variables:Bool)
	{
		for (file_name in file_names)
			parseFile(file_name, allow_unknown_variables);
	}

	public static function parseFile(file_name:String, ?allow_unknown_variables:Bool)
	{
		var file = Assets.getText('assets/data/$file_name.txt').split('\n');

		for (line in file)
		{
			var line_split = line.split('=');
			var variable = line_split[0];
			if (!allow_unknown_variables && !variables.exists(variable)) continue;
			var new_value = line_split[1];

			if (line_split.length > 2)
			{
				for (i in 0...line_split.length)
				{
					// Should I add a space?
					if (i > 1)
						new_value += line_split[i];
				}
			}

			var type_string = "abcdefghijklmnopqrstuvwxyz`~!@#$%^&*()-=_+[]\\;',/{}|:\"<>? ";
			var is_string:Bool = false;

			for (i in 0...type_string.length)
			{
				var letter = type_string.charAt(i);

				if (StringTools.contains(new_value.toLowerCase(), letter) && !is_string)
					is_string = true;
			}

			if (is_string)
				setVariable(variable, Std.string(new_value));
			else
				setVariable(variable, Std.parseFloat(new_value));
		}
	}
}
