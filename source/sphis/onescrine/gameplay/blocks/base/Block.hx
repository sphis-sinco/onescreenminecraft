package sphis.onescrine.gameplay.blocks.base;

import flixel.FlxSprite;
import haxe.Json;
import lime.utils.Assets;
import sphis.onescrine.gameplay.blocks.base.BlockConfig.BlockAsset;
import sphis.onescrine.gameplay.components.Component;

class Block extends FlxSprite
{
	public var config:BlockConfig;
	public var block_id:String;
	public var components:Array<Component> = [];

	public function new(block_id:String, X:Float = 0, Y:Float = 0)
	{
		super(x, y);
		this.block_id = block_id;

		config = cast Json.parse(Assets.getText('assets/data/blocks/' + block_id + '.json')) ?? null;
		if (config == null)
			config = {
				gameplay_asset: {
					path: 'blocks/temp-block',
					animated: true
				},
				inventory_name: 'Null Block: ' + block_id,
			}
		loadAsset(config.gameplay_asset);
	}

	public function loadAsset(asset:BlockAsset)
	{
		loadGraphic('assets/images/' + asset.path + '.png', asset.animated, asset.width ?? 16, asset.height ?? 16);

		if (asset.animated)
		{
			if (asset.animations.length <= 0 || asset.animations == null)
			{
				animation.frameIndex = asset.frame ?? 0;
			}
			else
			{
				for (animation in asset.animations)
				{
					final type = animation.type;

					final name = animation.name;
					final fps = animation.fps;
					final looped = animation.looped;
					final flipped_x = animation.flipped_x;
					final flipped_y = animation.flipped_y;

					if (type == 'frames')
						this.animation.add(name, animation.frames, fps, looped, flipped_x, flipped_y);
				}
			}
		}
	}
}
