package sphis.textvar;

import lime.utils.Assets;

class Textvar
{
	public static var states:Map<String, Map<String, Dynamic>> = [];

	public static function setStateVariable(state:String, variable:String, value:Dynamic)
	{
		if (!states.exists(state))
			states.set(state, []);

		var state = getState(state);
		state.set(variable, value);
	}

	public static function getState(state:String):Map<String, Dynamic>
	{
		return states.get(state);
	}

	public static function getStateVariable(state:String, variable:String):Dynamic
	{
		return getState(state).get(variable);
	}

	public static function parseAllStateOverwrites(fileName:String)
	{
		for (state => value in states)
			parseStateOverwrites(state, fileName);
	}

	public static function parseStateOverwrites(targetState:String, fileName:String)
	{
		var file = Assets.getText('assets/data/$fileName.txt').split('\n');

		for (line in file)
		{
			var lineSplit = line.split('__');
			var state = lineSplit[0];
			var variable = lineSplit[1];
			var newValue = lineSplit[2];

			if (lineSplit.length > 3)
			{
				for (i in 0...lineSplit.length)
				{
					// Should I add a space?
					if (i > 2)
						newValue += lineSplit[i];
				}
			}

			if (targetState == state)
			{
				var stateMap = states.get(state);
				var type_string = "abcdefghijklmnopqrstuvwxyz`~!@#$%^&*()-=_+[]\\;',/{}|:\"<>? ";
				var is_string:Bool = false;

				for (i in 0...type_string.length)
				{
					var letter = type_string.charAt(i);

					if (StringTools.contains(newValue.toLowerCase(), letter) && !is_string)
						is_string = true;
				}

				if (is_string)
				{
					stateMap.set(variable, Std.string(newValue));
				}
				else
				{
					stateMap.set(variable, Std.parseFloat(newValue));
				}
			}
		}
	}
}
