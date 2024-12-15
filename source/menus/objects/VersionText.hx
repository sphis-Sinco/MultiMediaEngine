package menus.objects;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class VersionText extends FlxText
{
	// Can be used for anything but mainly is version text, hehehehehehehhehehehehehehe
	override public function new(Text:Null<String> = null, Size:Int = 16)
	{
		super(0, 0, 0, Text, Size);

		setPosition(5, FlxG.height - 18);

		var coolText:String = MainMenuState.gameVer + (Main.watermarks ? (" FNF - " + MainMenuState.kadeEngineVer + " Kade Engine - " + MainMenuState.multiMediaVer + " Multimedia Engine") : "");
		if (Text != null)
			coolText = Text;

		text = coolText;
		scrollFactor.set();
		setFormat("VCR OSD Mono", Size, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	}
}
