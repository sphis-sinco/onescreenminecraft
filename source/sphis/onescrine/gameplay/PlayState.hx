package sphis.onescrine.gameplay;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import sphis.onescrine.gameplay.blocks.Block;

class PlayState extends FlxState
{
	public var backdrop:FlxSpriteGroup = new FlxSpriteGroup();
	public var blocks:FlxSpriteGroup = new FlxSpriteGroup();

	public var bso:FlxSprite = new FlxSprite();

	override function create()
	{
		add(backdrop);
		add(blocks);

		bso.loadGraphic('assets/images/gui/block-select-outline.png');
		bso.scale.set(Constants.UI_SCALE_MULTIPLIER, Constants.BLOCK_SCALE_MULTIPLIER);
		add(bso);
		bso.updateHitbox();

		var x = 0;
		var y = 0;

		while (y < 12)
		{
			while (x < 20)
			{
				var newBlock:Block = new Block(World.BACKDROP_BLOCK);
				newBlock.x = x * (newBlock.width);
				newBlock.y = y * (newBlock.height);
				backdrop.add(newBlock);

				x++;
			}

			y++;
			x = 0;
		}

		y = 0;

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

		bso.visible = false;
		bso.color = 0xFFFFFF;
		for (block in blocks)
		{
			if (FlxG.mouse.overlaps(block))
			{
				bso.setPosition(block.x, block.y);
				bso.visible = true;
			}
		}

		if (!bso.visible)
			for (block in backdrop)
			{
				if (FlxG.mouse.overlaps(block))
				{
					bso.setPosition(block.x, block.y);
					bso.visible = true;
					// bso.color = 0xA0A0A0;
				}
			}
	}
}
