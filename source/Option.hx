package;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import flash.utils.Timer;
import lime.math.Vector2;
/**
 * ...
 * @author ...
 */
class Option extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(5, 5, FlxColor.CYAN);
		
	}
	
		override public function update(elapsed:Float):Void
		
	{
		
		super.update(elapsed);
		
	}
	
	
	
}