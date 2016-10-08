package;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import flash.utils.Timer;
/**
 * ...
 * @author ...
 */
class Player extends FlxSprite

	{	
		public var velocidad:Int=3;
		public var bala:Bullet;
		public var fireRate:Float=2.5;
		public var tiempo:Timer;
		public var disparoActivo:Bool = false; 
		public var vidasPlayer:Int = 3;
		public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
	  super(X, Y, SimpleGraphic);
		tiempo = new Timer(100);
		
		makeGraphic(25,25,FlxColor.RED);
			
	tiempo.start();
	//	trace("hola mundo");
			
	}
	

	override public function update(elapsed:Float):Void
	
{
	super.update(elapsed);
	//trace("tiempo "+tiempo.currentCount);

	Teclas();
	
}
	
	

public function Teclas(){
	//trace(" tiempo " + tiempo.currentCount);
	if(tiempo.currentCount>fireRate){
tiempo.reset();
		disparoActivo = false;
		//
	}
		if (FlxG.keys.pressed.DOWN&&this.y<FlxG.height-this.height){
		
	y += velocidad;
		
	}else if(FlxG.keys.pressed.UP&&this.y>0)
	{
			
	y -= velocidad;
	}
	if (FlxG.keys.pressed.RIGHT&&this.x<FlxG.width-this.width){
	
		
	x += velocidad;
	}else if (FlxG.keys.pressed.LEFT&&this.x>0){
		
	x -= velocidad;
		
	}
	if (FlxG.keys.justPressed.SPACE&&disparoActivo==false){
    // tiempo.reset();
	tiempo.start();
	disparoActivo = true;
	
//	trace("disparo");
	//tiempo.stop();
		var x_player:Int;
		var y_player:Int; 
		bala = new Bullet(0,0,null,1,14);
		bala.x = this.x + this.width / 2 + bala.width;
		bala.y = this.y+this.height/2-bala.height/2;
		FlxG.state.add(bala);	
			
		}
		
		
		
	
		
	}
}