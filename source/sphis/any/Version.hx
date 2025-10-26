package sphis.any;

class Version
{
	public var version:Array<Null<Int>> = [0, 0, 0];

	public function new(?major:Null<Int>, ?minor:Null<Int>, ?patch:Null<Int>)
	{
		this.version = [major ?? 0];

		if (minor != null)
			this.version.push(minor);
		if (patch != null)
			this.version.push(patch);
	}

	public function toString():String
	{
		return major + '.' + minor + '.' + patch;
	}

	public function fromVersion(version:Version, ?offsets:Array<Int>):Version
	{
		final major_offset:Int = offsets[0] ?? 0;
		final minor_offset:Int = offsets[1] ?? 0;
		final patch_offset:Int = offsets[2] ?? 0;

		return new Version(version.major - major_offset, version.minor - minor_offset, version.patch - patch_offset);
	}

	public var major(get, set):Int;

	function get_major():Int
		return version[0];

	function set_major(major:Int):Int
	{
		version[0] = major;
		return major;
	}

	public var minor(get, set):Null<Int>;

	function get_minor():Null<Int>
		return version[1] ?? 0;

	function set_minor(minor:Null<Int>):Null<Int>
	{
		if (minor == null && version.length == 2)
			version.remove(version[1]);
		else
			version[1] = minor;
		return minor;
	}

	public var patch(get, set):Null<Int>;

	function get_patch():Null<Int>
		return version[2] ?? 0;

	function set_patch(patch:Null<Int>):Null<Int>
	{
		if (patch == null && version.length == 3)
			version.remove(version[2]);
		else
			version[2] = patch;
		return patch;
	}
}