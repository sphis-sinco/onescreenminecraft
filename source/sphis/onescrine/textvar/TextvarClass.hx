package sphis.onescrine.textvar;

class TextvarClass
{
	public function new() {}

	public var file_names(get, set):Array<String>;

	function get_file_names():Array<String>
	{
		return Textvar.file_names;
	}

	function set_file_names(file_names:Array<String>):Array<String>
	{
		Textvar.file_names = file_names;
		return Textvar.file_names;
	}

	public var variables(get, set):Map<String, Dynamic>;

	function get_variables():Map<String, Dynamic>
		return Textvar.variables;

	function set_variables(variables:Map<String, Dynamic>):Map<String, Dynamic>
	{
		Textvar.variables = variables;
		return Textvar.variables;
	}

	public function setVariable(variable:String, value:Dynamic)
		Textvar.setVariable(variable, value);

	public function getVariable(variable:String):Dynamic
		return Textvar.getVariable(variable);

	public function parseAllFiles(allow_unknown_variables:Bool)
		Textvar.parseAllFiles(allow_unknown_variables);

	public function parseFile(file_name:String, ?allow_unknown_variables:Bool)
		Textvar.parseFile(file_name, allow_unknown_variables);
}
