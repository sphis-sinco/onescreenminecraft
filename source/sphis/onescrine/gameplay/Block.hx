package sphis.onescrine.gameplay;

import sphis.onescrine.gameplay.components.Component;

class Block
{
	public var id:String;

	public var components:Array<Component> = [];

	public function new(id:String, ?components:Array<Component>)
	{
		this.id = id;
		this.components = components;
	}
}
