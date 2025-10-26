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
			var current_layer_block = layerBlocks[layer] ?? '';
			var current_layer_height:Null<Int> = layerHeights[layer] ?? null;

			if (current_layer_height > y && layer == 0)
				y = current_layer_height;

			var next_layer_block = layerBlocks[layer + 1] ?? '';
			var next_layer_height:Null<Int> = layerHeights[layer + 1] ?? null;
			var next_layer_random_height:Null<Int> = layerRandomHeights[layer + 1] ?? null;

			trace('current_layer_block: ' + current_layer_block);
			trace('current_layer_height: ' + current_layer_height);

			trace('next_layer_block: ' + next_layer_block);
			trace('next_layer_height: ' + next_layer_height);
			trace('next_layer_random_height: ' + next_layer_random_height);

			trace('y: ' + y);

			while (x < 20)
			{
				if (current_layer_block != null && current_layer_block != '')
				{
					var newBlock:Block;
					var is_next_block:Bool = false;

					if ((next_layer_block != null && next_layer_block != '')
						&& (FlxG.random.bool(FlxG.random.float(0, 100)) && (next_layer_height - y <= next_layer_random_height)))
					{
						newBlock = new Block(next_layer_block);
						is_next_block = true;
					}
					else
						newBlock = new Block(current_layer_block);

					newBlock.x = x * (newBlock.width);
					newBlock.y = y * (newBlock.height);
					blocks.add(newBlock);
				}

				x++;
			}

			y++;
			x = 0;

			if (next_layer_height != null)
				if (y == next_layer_height)
					layer++;
		}

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
