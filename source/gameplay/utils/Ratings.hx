package gameplay.utils;

class Ratings
{
    public static function CalculateRating(noteDiff:Float, ?customSafeZone:Float):String
    {

        var customTimeScale = Conductor.timeScale;

        if (customSafeZone != null)
            customTimeScale = customSafeZone / 166;

        // trace(customTimeScale + ' vs ' + Conductor.timeScale);

        // I HATE THIS IF CONDITION
        // IF LEMON SEES THIS I'M SORRY :(
        // DONT WORRY KADE I GOT U

		SHIT_NOTE = (noteDiff < -135 * customTimeScale || noteDiff > 135 * customTimeScale);
		BAD_NOTE = (noteDiff < -90 * customTimeScale);
		GOOD_NOTE = (noteDiff > 45 * customTimeScale || noteDiff < -45 * customTimeScale);
		SICK_NOTE = (!GOOD_NOTE && !BAD_NOTE && !SHIT_NOTE);
        
        if (GOOD_NOTE)
            return "good";

        if (BAD_NOTE)
            return "bad";
        
        if (SHIT_NOTE)
            return "shit";

        if (SICK_NOTE)
            return "sick";

        trace('Somehow didnt meet any of the conditions');
        return 'sick';
    }

	private static var SICK_NOTE:Bool = false;
	private static var GOOD_NOTE:Bool = false;
	private static var BAD_NOTE:Bool = false;
	private static var SHIT_NOTE:Bool = false;
}