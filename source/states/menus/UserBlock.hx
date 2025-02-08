package states.menus;

import flixel.util.FlxColor;
import flixel.FlxG;
import data.Paths;
#if (VIDEOS_ALLOWED && hxvlc)
import objects.PsychVideo;
#end
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;

class UserBlock extends MusicBeatState {
    override public function create() {
        super.create();
#if (VIDEOS_ALLOWED && hxvlc)
        var pomni:PsychVideo = new PsychVideo();
        pomni.load(Paths.video('pomni'), [':input-repeat=65535']);
        pomni.play();
        add(pomni);
        pomni.scale.set(2.5, 2.5);
        #end

        var message:FlxText = new FlxText(0,0, 800, 'you have been blocked from fdf', 32);
        message.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		message.scrollFactor.set();
		message.borderSize = 1.25;
        add(message);
        message.alpha = 0.001;
        message.screenCenter();

        FlxTween.tween(message, {alpha: 1}, 3);
    }
}