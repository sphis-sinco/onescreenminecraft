package sphis.onescrine.gameplay.blocks;

import sphis.onescrine.gameplay.components.Component;

typedef BlockConfig =
{
	var gameplay_asset:BlockAsset;

	var ?inventory_asset:BlockAsset;
	var ?inventory_name:String;

	var ?components:Array<Component>;
}

typedef BlockAsset =
{
	var path:String;

	var ?animated:Bool;
	var ?width:Null<Int>;
	var ?height:Null<Int>;
	var ?frame:Null<Int>;
	var ?animations:Array<BlockAssetAnimation>;
}

typedef BlockAssetAnimation =
{
	var type:String;
	var name:String;
	var ?reference:String;
	var ?conditions:Array<String>;

	var ?frames:Array<Int>;

	var ?fps:Null<Int>;
	var ?looped:Bool;
	var ?flipped_x:Bool;
	var ?flipped_y:Bool;
}
