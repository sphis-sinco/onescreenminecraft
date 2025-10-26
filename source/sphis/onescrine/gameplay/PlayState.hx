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

		var x = 0;
		var y = 0;

		while (y < 12)
		{
			while (x < 20)
			{
				var newBlock = new TempBlock();
				newBlock.x = x * (newBlock.width);
				newBlock.y = y * (newBlock.height);
				blocks.add(newBlock);

				x++;
			}

			y++;
			x = 0;
		}

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
