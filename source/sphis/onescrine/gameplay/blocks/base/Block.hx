package sphis.onescrine.gameplay.blocks.base;

import flixel.FlxSprite;
import lime.utils.Assets;
import sphis.onescrine.gameplay.components.Component;

class Block
{
	public var id:String;
	public var components:Array<Component> = [];
	public var asset:FlxSprite;

	public function new(id:String, ?components:Array<Component>)
	{
		this.id = id;
		this.components = components;
		asset = new FlxSprite();

		if (Assets.exists('assets/images/blocks/' + id + '.png'))
		{
			asset.loadGraphic('assets/images/blocks/' + id + '.png');
		}
		else {}
	}
}
