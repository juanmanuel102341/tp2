package;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tweens.FlxTween;
/**
 * ...
 * @author ...
 */
class Enemigos_A extends FlxSprite
{
	public var velocidad:Int=3;
	public var balasEnemigos:Bullet;
	public var velocidad_balas_eA:Int = 10;
	
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		
		super(X, Y, SimpleGraphic);
		
		makeGraphic(40, 40, FlxColor.BLUE);
	    
		x = FlxG.width;
		//y = height;
		balasEnemigos = new Bullet(0,0,null,-1,12);
		balasEnemigos.x = this.x;
		balasEnemigos.y = this.y / 2;
		
	FlxG.state.add(balasEnemigos);	
	
	
	}
	
	override public function update(elapsed:Float):Void
		
	{
		super.update(elapsed);
		MoverEnemigo();
	FlxTween.tween(this, {x:400, y:300},2);
		
	}
	
	
	public function MoverEnemigo():Void{
		
	x -= velocidad;
		
	if (this.x < 0){
	//trace("destruccion");
		destroy();
		
	}
	
	}
	
	
	
}