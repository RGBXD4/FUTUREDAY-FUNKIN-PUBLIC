package engine.script;

import util.CoolUtil;
import data.WeekData;
import states.game.PlayState;
import song.Conductor;
import data.ClientPrefs;
import flixel.FlxBasic;
import flixel.FlxSprite;
import meta.states.*;

using StringTools;
/**
This is a base class meant to be overridden so you can easily implement custom script types
**/

class FunkinScript {
	public var scriptName:String = '';
	public var scriptType:String = '';
	/**
		Called when the script should be stopped
	**/
	public function stop(){
		throw new haxe.exceptions.NotImplementedException();
	}

	/**
		Called to output debug information
	**/
	public function scriptTrace(text:String){
		trace(text); // wow for once its not NotImplementedException
	}
	/**
		Called to set a variable defined in the script
	**/
	public function set(variable:String, data:Dynamic):Void
	{
		throw new haxe.exceptions.NotImplementedException();
	}

	/**
		Called to get a variable defined in the script
	**/
	public function get(key:String):Dynamic
	{
		throw new haxe.exceptions.NotImplementedException();
	}

	/**
		Called to call a function within the script
	**/
	public function call(func:String, ?args:Array<Dynamic>):Dynamic
	{
		throw new haxe.exceptions.NotImplementedException();
	}

	/**
		Helper function
		Sets a bunch of basic variables for the script depending on the state
	**/
	function setDefaultVars(){
		var currentState = flixel.FlxG.state;
		if ((currentState is PlayState))
		{
			set("inPlaystate", true);
			set('bpm', PlayState.SONG.bpm);
			set('scrollSpeed', PlayState.SONG.speed);
			set('songName', PlayState.SONG.song);
			set('isStoryMode', PlayState.isStoryMode);
			set('difficulty', PlayState.storyDifficulty);
			set('weekRaw', PlayState.storyWeek);
			set('seenCutscene', PlayState.seenCutscene);
			set('week', WeekData.weeksList[PlayState.storyWeek]);
			set('difficultyName', CoolUtil.difficulties[PlayState.storyDifficulty]);
			set('songLength', flixel.FlxG.sound.music.length);
			set('botPlay', PlayState.instance.cpuControlled);
			set('practice', PlayState.instance.practiceMode);
			set('startedCountdown', false);

			// call('onCreate');
		}
		else
		{
			set("inPlaystate", false);
		}
		
		set('inGameOver', false);
		set('downscroll', ClientPrefs.downScroll);
		set('middlescroll', ClientPrefs.middleScroll);
		set('framerate', ClientPrefs.framerate);
		set('ghostTapping', ClientPrefs.ghostTapping);
		set('hideHud', ClientPrefs.hideHud);
		set('timeBarType', ClientPrefs.timeBarType);
		set('cameraZoomOnBeat', ClientPrefs.camZooms);
		set('flashingLights', ClientPrefs.flashing);
		set('noteOffset', ClientPrefs.noteOffset);
		set('healthBarAlpha', ClientPrefs.healthBarAlpha);
		set('noResetButton', ClientPrefs.noReset);
		set('lowQuality', ClientPrefs.lowQuality);
		set("scriptName", scriptName);

		set('curBpm', Conductor.bpm);
		set('crochet', Conductor.crochet);
		set('stepCrochet', Conductor.stepCrochet);
		set('Function_Halt', Globals.Function_Halt);
		set('Function_Stop', Globals.Function_Stop);
		set('Function_Continue', Globals.Function_Continue);
		set('curBeat', 0);
		set('curStep', 0);
		set('curDecBeat', 0);
		set('curDecStep', 0);
		// set('version', MainMenuState.psychEngineVersion.trim()); we dont have a version! lol!

		// set('Deserializer', meta.Deserializer);
	}
}

interface IFunkinScript
{
	public var scriptName:String;
	public var scriptType:String;
	public function set(variable:String, data:Dynamic): Void;
	public function get(key:String):Dynamic;
	public function call(func:String, ?args:Array<Dynamic>):Dynamic;
	public function stop():Void;
}