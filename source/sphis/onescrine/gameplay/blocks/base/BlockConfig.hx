package sphis.onescrine.gameplay.blocks.base;

import sphis.onescrine.gameplay.components.Component;

typedef BlockConfig =
{
	var ?gameplay_asset:BlockAsset;

	var ?inventory_asset:BlockAsset;
	var ?inventory_name:String;
	
    var ?components:Array<Component>;
}

typedef BlockAsset =
{
	var path:String;
	var ?animated:Bool;
	var ?width:Int;
	var ?height:Int;
	var ?animations:Array<BlockAssetAnimation>;
}

typedef BlockAssetAnimation =
{
	var type:String;
	var name:String;
	var ?frames:Array<Int>;
	var ?fps:Int;
	var ?looped:Bool;
}
