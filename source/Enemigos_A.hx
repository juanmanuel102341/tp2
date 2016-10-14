package;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.math.FlxMath;
import flash.utils.Timer;
/**
 * ...
 * @author ...
 */
class Enemigos_A extends FlxSprite
{
	public var velocidad:Int=-50;
	public var balasEnemigos:Bullet;
	public var velocidad_balas_eA:Int = 10;
	public var componenteX:Float;
	public var componenteY:Float;
	public var g:Float = 0.0;
	private var tiempoCaida:Float=4.0;
	private var timer:Timer;
	private var posYinicial:Float;
	
	private var tiempoDisparo:Timer = new Timer(1000);
	public var fireRateA:Float = 0.5;
	public var velocidadBala_A:Int = 8;
	private var arrayBalasA = new Array();
	private var bulletA:Bullet;
		
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		
		super(X, Y, SimpleGraphic);
		timer = new Timer(100);
		makeGraphic(25, 25, FlxColor.BLUE);
	    
		x = FlxG.width-this.width;
	//	trace("x= "+x);
		y = FlxG.height / 2-this.height/2;
		//trace("y= " + y);
		
		
				
	FlxG.state.add(balasEnemigos);	
posYinicial = y;
componenteX = Math.cos( 0.8);//
componenteY = Math.sin(2.5);//
	
	
	//	FlxTween.angle(this, 0, 90, 5);
	//	FlxTween.tween(this, {x:100	, y:0},10);
	
	
//	MoverEnemigo();
	//this.velocity.x =;
//this.acceleration.y = 120;

	tiempoDisparo.start();
	}
	
	override public function update(elapsed:Float):Void
		
	{
		
		super.update(elapsed);
	
		g += 0.30;
		//trace(g);
	if (this.y >=posYinicial){
	//trace("destruccion");
	
	g = 0;
//timer.reset();
//timer.start();

//tiempoCaida = 8;
	//	destroy();
		
	}
		MoverEnemigo();
	
		DisparoA();
	}
	
	
	public function MoverEnemigo():Void{
	//this.velocity.x = velocidad*componenteX;
		//this.velocity.y = velocidad * componenteY - g;
	
		//trace("componente x " + this.velocity.x );
//	trace("componente y " + this.velocity.y );
	//this.velocity.x= -38;
	
		//this.velocity.y = -48;
//this.x -= 2*componenteX;
//this.y -= 4 * componenteY;
this.x -= 2;
this.y -= 5;
this.y += g;

//		trace("pos y "+this.y);
//this.angularVelocity =-10;
//	this.angularDrag =-8;


//trace("tiempo "+timer.currentCount );

if(this.x < 0){

	
	x = FlxG.width;
}
	}
	
	public function DisparoA(){
		//for (ic in 0...arrayBalasA.length)
//{
	////balaC.x -= velocidadBalaC * proporcionX;
	//////balaC.y -= velocidadBalaC * proporcionY;
	////
	//arrayBalasA[ic].MoverBala(1,0);
	//if (arrayBalasA[ic].x < 0||arrayBalasA[ic].y<0||arrayBalasA[ic].y>FlxG.height){
		//////arrayBalasA[ic].DestruccionBala();
		//////arrayBalasB.remove(arrayBalasB[ib]);
		//////}
	//////
		////
		//}
	////
//}

if(bulletA != null){
	
	bulletA.MoverBala(1, 0);

	if (bulletA.x < 0){
		bulletA.DestruccionBala();
	
		bulletA = null;
		
	}
	
}

		if (tiempoDisparo.currentCount > fireRateA&&bulletA==null){
		
		bulletA = new Bullet(0, 0, null, -1, 1, 6);
		bulletA.x = this.x;
		bulletA.y = this.y;
		
			FlxG.state.add(bulletA);
		//arrayBalasA.push(bulletA);
		//FlxG.state.add(bulletA);
	
		tiempoDisparo.reset();
		
		tiempoDisparo.start();
	
		
		}	
		
	
	
	}
	
}