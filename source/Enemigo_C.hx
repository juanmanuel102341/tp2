package;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;
import neko.Random;
//import lime.math.Vector2;
import flixel.math.FlxAngle;
 import flash.utils.Timer;

/**
 * ...
 * @author ...
 */
class Enemigo_C extends FlxSprite
{
	private var tiempoDisparo:Timer=new Timer(1000);
	
//	private var coordX:Int;
	//private var coordY:Int;
	//private var tiempoLimite:Int = 2;
	private var random_num_Y:Int;
	private var random_num_X:Int;
	private var bulletEnemigo_C:Bullet; 
	
	private var fireRate:Int=4;
	private var proporcionY_enemigo_c:Float;
	private var proporcionY_jugador:Float;
	private var proporcionX:Float;
	private var proporcionY:Float;
	private var distancia_x:Float;
	private var distancia_y:Float;
	
	private var coordxJugador:Float=0;
	private var coordYJugador:Float=0;
	
	private var coordxEnemigo:Float;
	private var coordYEnemigo:Float;
	private var calculo:Float;
	private var calculoX:Float;
	private var calculoY:Float;
	private var velocidadBalaC:Int = 3;
	private var balaC:FlxSprite;
	private var distanciaSprites:Int;
	
	var bala:Bullet;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		
		super(X, Y, SimpleGraphic);
		makeGraphic(5, 20, FlxColor.CYAN);
		coordxEnemigo = this.x;
		coordYEnemigo = this.y;
		
		//trace("ancho: " + FlxG.width);
	//	trace("ancho/2: " + Math.round(FlxG.width / 2));
		//random_num = Math.round(Math.random() * FlxG.width)+Math.round(FlxG.width/2);
		tiempoDisparo.start();
		random_num_X=	FlxG.random.int(Math.round(FlxG.width / 2), FlxG.width);
		random_num_Y=	FlxG.random.int(Math.round(this.height), Math.round(FlxG.height-this.height));
		
		x = random_num_X;
		y = random_num_Y;
			
	//	trace("random "+random_num);
		//
		
	}
	override public function update(elapsed:Float):Void
		
	{
		
		super.update(elapsed);
		coordxEnemigo = this.x;
		coordYEnemigo = this.y;
		
		if (bala != null){
			bala.MoverBala(proporcionX, proporcionY);
		
			if (bala.x < 0 || bala.x > 5000 || bala.y > FlxG.height || bala.y < 0){
				//trace("bala c muerte");
				bala.destroy();
			
				bala = null;
			}
			
		}
		DisparoEnemigo_C();
		
	}
	public function DisparoEnemigo_C(){
	
	if (tiempoDisparo.currentCount > fireRate&&bala==null){
		
		tiempoDisparo.reset();
	
		//bulletEnemigo_C = new Bullet(0, 0, null, -1, velocidadBalaC);
	//bulletEnemigo_C.x = this.x;
	//bulletEnemigo_C.y = this.y;
	//FlxG.state.add(bulletEnemigo_C);
	//balaC = new FlxSprite();
	//balaC.x = this.x;
	//balaC.y = this.y;
	bala = new Bullet(0, 0, null, -1,-1, 4);
	bala.x = this.x;
	bala.y = this.y;

	//arrayBalas_C.push(bala);
	
	FlxG.state.add(bala);	

	distancia_x=coordxEnemigo - coordxJugador;//distancia en x
	//
	distancia_y = coordYEnemigo - coordYJugador;//distancia en y
	////trace("d)
	proporcionX = distancia_x / distanciaSprites;
	//
	proporcionY = distancia_y / distanciaSprites;
	
	
//trace("distancia_x"+distancia_x);
	//
	//trace("distancia_y "+distancia_y);
	//
	//trace("proporcionX "+proporcionX);
	//
	//trace("proporcionY "+proporcionY);
	//
	tiempoDisparo.start();
	
	
	}

	
	
	}

	public function ObtencionCoordenadasJugador_c(x_jugador:Float,y_jugador:Float){
	
		 coordxJugador= x_jugador;
		coordYJugador = y_jugador;
	
		
		//trace("posicion jugador x:" +coord_playerX);
	//	trace("posicion jugador y:" +coord_playerY);
		
	}
	public function ObtencionDistancia(_distancia:Int){
	
		distanciaSprites = _distancia;
		//trace("distanciaSprites " + distanciaSprites);
		
	}
	
	   public function ContactoPlayerEnemigoC(obj:Player){
		
		if (bala != null){
			
			if (bala.overlaps(obj)){
				
				//trace("contacto torreta");
			}
			
		}
		
	}
}