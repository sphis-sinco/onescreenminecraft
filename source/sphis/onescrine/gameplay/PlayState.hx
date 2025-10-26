package sphis.onescrine.gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import sphis.onescrine.gameplay.blocks.TempBlock;
import sphis.onescrine.gameplay.blocks.base.Block;
import sphis.onescrine.ui.ScaledUIBox;

class PlayState extends FlxState
{
	public var blocks:FlxSpriteGroup = new FlxSpriteGroup();

	override function create()
	{
		add(blocks);

		var w = 0;
		var h = 0;

		while (h < 12)
		{
			while (w < 20)
			{
				var newBlock = new TempBlock();
				newBlock.x = w * (newBlock.width);
				newBlock.y = h * (newBlock.height);
				blocks.add(newBlock);

				w++;
			}

			h++;
			w = 0;
		}

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
