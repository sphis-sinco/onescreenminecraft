package sphis.onescrine.gameplay;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import sphis.onescrine.gameplay.blocks.Block;

class PlayState extends FlxState
{
	public var blocks:FlxSpriteGroup = new FlxSpriteGroup();

	override function create()
	{
		add(blocks);

		var x = 0;
		var y = 0;

		var layer = 0;
		var layerBlocks:Array<String> = [];
		var layerHeights:Array<Null<Int>> = [];
		var layerRandomHeights:Array<Null<Int>> = [];

		while (layer < World.LAYERS)
		{
			layer++;

			layerBlocks.push(World.getLayerBlock(layer));
			layerHeights.push(World.getLayerHeight(layer));
			layerRandomHeights.push(World.getLayerRandomHeight(layer));
		}

		layer = 0;

		trace(layerBlocks);
		trace(layerHeights);
		trace(layerRandomHeights);

		while (y < 12)
		{
			var current_layer_block = layerBlocks[layer];
			var next_layer_height:Null<Int> = layerHeights[layer + 1] ?? null;
			var next_layer_random_height:Null<Int> = layerRandomHeights[layer + 1] ?? null;

			trace(current_layer_block);
			trace(next_layer_height);
			trace(next_layer_random_height);

			while (x < 20)
			{
				var newBlock:Block = new Block(current_layer_block);
				newBlock.x = x * (newBlock.width);
				newBlock.y = y * (newBlock.height);
				blocks.add(newBlock);

				x++;
			}

			y++;
			x = 0;

			if (next_layer_height != null)
				if (next_layer_random_height == null)
				{
					if (y >= next_layer_height)
						layer++;
				}
				else
				{
					// if (y == (next_layer_height + FlxG.random.int(0, next_layer_random_height)))
					// 	layer++;
				}
		}

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
