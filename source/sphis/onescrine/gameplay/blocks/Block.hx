package sphis.onescrine.gameplay.blocks;

import flixel.FlxSprite;
import haxe.Json;
import lime.utils.Assets;
import sphis.onescrine.gameplay.blocks.BlockConfig.BlockAsset;
import sphis.onescrine.gameplay.blocks.BlockConfig.BlockAssetAnimation;
import sphis.onescrine.gameplay.components.Component;

using Math;
using sphis.any.MinecraftDataTrace;

class Block extends FlxSprite
{
	public var config:BlockConfig;
	public var animation_conditions:Map<String, Array<String>> = [];

	public var block_id:String;
	public var components:Array<Component> = [];

	public function new(block_id:String, X:Null<Float> = 0, Y:Null<Float> = 0)
	{
		this.block_id = block_id;

		try
		{
			config = cast Json.parse(Assets.getText('assets/data/blocks/' + block_id + '.json')) ?? null;
		}
		catch (e)
		{
			trace(e.message);
			config = null;
		}
		if (config == null)
			config = {
				gameplay_asset: {
					path: 'blocks/temp-block',
					animated: true,
					width: Constants.BLOCK_DEFAULT_WIDTH,
					height: Constants.BLOCK_DEFAULT_HEIGHT,
				},
				inventory_name: 'Null Block: ' + block_id,
			}
		else
			trace('Created Block with block_id=' + this.block_id + ((X.abs() > 1.0 || Y.abs() > 0.0) ? ' and position={x=' + X + ', y=' + Y + '}' : ''));

		super(X, Y);
		loadAsset(config.gameplay_asset);
	}

	public function loadAsset(asset:BlockAsset)
	{
		this.animation.onFinish.removeAll();

		loadGraphic('assets/images/' + asset.path + '.png', asset.animated, asset.width ?? Constants.BLOCK_DEFAULT_WIDTH,
			asset.height ?? Constants.BLOCK_DEFAULT_HEIGHT);

		if (asset.animated && (asset?.animations != null || asset?.animations?.length > 0))
		{
			for (animation in asset.animations)
			{
				final current_animation:BlockAssetAnimation = animation;

				final name = current_animation.name;
				final reference = current_animation.reference;

				for (ref_animation in asset.animations)
					if (reference == ref_animation.name)
					{
						if (ref_animation.flipped_x != null || current_animation.flipped_x != null)
							current_animation.flipped_x = current_animation.flipped_x ?? ref_animation.flipped_x ?? null;

						if (ref_animation.flipped_y != null || current_animation.flipped_y != null)
							current_animation.flipped_y = current_animation.flipped_y ?? ref_animation.flipped_y ?? null;

						if (ref_animation.fps != null || current_animation.fps != null)
							current_animation.fps = current_animation.fps ?? ref_animation.fps ?? null;

						if (ref_animation.frames != null || current_animation.frames != null)
							current_animation.frames = current_animation.frames ?? ref_animation.frames ?? null;

						if (ref_animation.looped != null || current_animation.looped != null)
							current_animation.looped = current_animation.looped ?? ref_animation.looped ?? null;

						if (ref_animation.type != null || current_animation.type != null)
							current_animation.type = current_animation.type ?? ref_animation.type ?? null;

						if (ref_animation.conditions != null && current_animation.conditions != null)
							current_animation.conditions.concat(ref_animation.conditions);
						else if (ref_animation.conditions != null || current_animation.conditions != null)
							current_animation.conditions = current_animation.conditions ?? ref_animation.conditions ?? null;
					}

				final type = current_animation.type;
				final conditions = current_animation.conditions;

				final fps = current_animation.fps ?? 24;
				final looped = current_animation.looped ?? true;
				final flipped_x = current_animation.flipped_x ?? false;
				final flipped_y = current_animation.flipped_y ?? false;

				if (type == 'frames')
					this.animation.add(name, current_animation.frames, fps, looped, flipped_x, flipped_y);

				animation_conditions.set(name, conditions ?? []);

				if (this.animation.getNameList().contains(name) && doesAnimationHaveCondition(name, 'default'))
					this.animation.play(name);
			}
		}

		this.animation.onFinish.add(animName ->
		{
			// 'finished ' + animName

			for (animation in this.animation.getNameList())
			{
				// 'checking ' + animation + ' for after-' + animName

				if (doesAnimationHaveCondition(animation, 'after-' + animName))
				{
					// 'moved to ' + animation
					this.animation.play(animation);
				}
			}
		});
		this.scale.set(Constants.BLOCK_SCALE_MULTIPLIER, Constants.BLOCK_SCALE_MULTIPLIER);
		this.updateHitbox();
	}

	public function getAnimationCondition(name:String):Array<String>
		return this.animation_conditions.get(name);

	public function doesAnimationHaveCondition(name:String, condition:String):Bool
		return this.animation_conditions.get(name).contains(condition);
}
