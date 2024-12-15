package editors;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

using StringTools;

class EditorSelector extends MusicBeatState
{
	public var selected:Int = 0;

	public var options:Array<String> = ['Chart Editor', 'Character Editor'];

	public var menuItems:FlxTypedGroup<Alphabet>;

	override public function new()
	{
		super();

		menuItems = new FlxTypedGroup<Alphabet>();

        var index:Int = 0;
        for (editor in options)
        {
            var editorText:Alphabet = new Alphabet(10, 10 + (index * 60), editor, true);
            editorText.ID = index;
            menuItems.add(editorText);

            index++;
        }

		var versionShit:VersionText = new VersionText();
		add(versionShit);
	}

	override public function create()
	{
		super.create();

		add(menuItems);
        updateMenuItems();
	}

	override public function update(elapsed:Float)
	{
		var downR:Bool = controls.DOWN_R;
		var upR:Bool = controls.UP_R;
		var accept:Bool = controls.ACCEPT;
		var back:Bool = controls.BACK;

		if (downR || upR)
        {
			if (downR)
                selected++;
			else if (controls.UP_R)
				selected--;

			if (selected < 0)
				selected = 0;
			else if (selected > options.length - 1)
				selected = options.length - 1;
            else
                FlxG.sound.play(Paths.sound('scrollMenu'));

			updateMenuItems();
        } else if (accept) {
            var selectedOpt:String = options[selected];

			switch (selectedOpt.replace(' ', '-').toLowerCase())
            {
                case 'chart-editor', 'charteditor', 'chart', 'charting':
                    if (PlayState.SONG == null) {
                        var json:String = Highscore.formatSong('tutorial', 2);
                        PlayState.SONG = Song.loadFromJson(json, 'tutorial');
                    }
                    FlxG.switchState(new ChartingState());

                default:
                    trace('Unimplemented option selection: $selectedOpt');
            }
		} else if (back) {
            FlxG.switchState(new MainMenuState());
        }

		super.update(elapsed);
	}

    public function updateMenuItems()
    {
        for (item in menuItems)
        {
			item.alpha = 0.5;

            if (selected == item.ID)
                item.alpha = 1.0;
        }
    }
}
