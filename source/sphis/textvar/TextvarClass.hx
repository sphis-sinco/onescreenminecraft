package sphis.textvar;

class TextvarClass
{
	/**
	 * This is pointless.
	 * 
	 * Without it tho everything crashes
	 */
	public function new() {}

	public var states(get, set):Map<String, Map<String, Dynamic>>;

	function set_states(value:Map<String, Map<String, Dynamic>>):Map<String, Map<String, Dynamic>>
	{
		Textvar.states = value;

		return states;
	}

	function get_states():Map<String, Map<String, Dynamic>>
		return Textvar.states;

	public function setStateVariable(state:String, variable:String, value:Dynamic)
		Textvar.setStateVariable(state, variable, value);

	public function getState(state:String):Map<String, Dynamic>
		return Textvar.getState(state);

	public function getStateVariable(state:String, variable:String):Dynamic
		return Textvar.getStateVariable(state, variable);

	public function parseAllStateOverwrites(fileName:String)
		Textvar.parseAllStateOverwrites(fileName);

	public function parseStateOverwrites(targetState:String, fileName:String)
		Textvar.parseStateOverwrites(targetState, fileName);
}
