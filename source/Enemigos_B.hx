package;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;
//import lime.math.Vector2;
import flixel.math.FlxAngle;
import flash.utils.Timer;
/**
 * ...
 * @author ...
 */
class Enemigos_B extends FlxSprite
{
	private var velocidad_b :Int=1;
	private var coord_playerX:Float;
	private var coord_playerY:Float;
	private var coord_Enemigo_X:Float;
	private var coord_Enemigo_Y:Float;
	
	private var resultadoPlayer:Float;
	private var resultadoEnemigo_B:Float;
	private var anguloPlayer:Float;
	private var anguloEnemigo:Float;
	private var moduloEnemigoJugador:Float;
	private var resultadoEnemigo_modulo:Float;
	private var resultadoPlayerModulo:Float;
	
	private var tiempoDisparo:Timer=new Timer(1000);
	public var fireRateC:Float = 0.5;
	public var velocidadBalaB:Int = 8;
	private var arrayBalasB = new Array();
	
	private var angulo_player_enemigo:Float;
	var calc:Float;
	
	private var proporcionX:Float=1;
	private var proporcionY:Float = 1;
	
	private var proporcionX_y:Float;
	private var proporcionY_jugador:Float;
	private var proporcionY_enemigo:Float;
	private var razonEnemigo_jugador:Float;
	private var distanciaPersecucion:Float;
	private var ProporcionPersecucion:Float=1;
	private var anchoPlayer:Float;

	var bulletB:Bullet;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(15, 15, FlxColor.MAGENTA);
	
		//x = FlxG.width ;
		//y = FlxG.height ;
		coord_Enemigo_X = this.x;
		coord_Enemigo_Y = this.y;
		//coordX_player=FlxG.j
	//moduloEnemigoJugador=FlxG.
	
	tiempoDisparo.start();
	
	}
	
	override public function update(elapsed:Float):Void
		
	{
		super.update(elapsed);
	
	
	
		MoverEnemigoB();
	
		
		
	}
	public function MoverEnemigoB():Void{
		
		
	proporcionY_enemigo = this.y / FlxG.height;
	//trace("prop enemigo " + proporcionY_enemigo);
	
	proporcionY_jugador = coord_playerY / FlxG.height;
	
	//trace("prop jugador " + proporcionY_jugador);
	
	razonEnemigo_jugador = proporcionY_enemigo - proporcionY_jugador;
	//trace("razon enemigo/jugador " + razonEnemigo_jugador);
proporcionX = 1 - razonEnemigo_jugador;
//trace("prop x " + proporcionX);
	
x -= velocidad_b*proporcionX*ProporcionPersecucion;
	y -= velocidad_b*razonEnemigo_jugador*ProporcionPersecucion;
LimiteEscenario();
	
	
	if (this.angle < angulo_player_enemigo){
		
		calc = angulo_player_enemigo - this.angle;
//trace("enemigo: "+this.angle);	
//trace("diferencia + " + calc);
//trace("angulo player enemigo: " + angulo_player_enemigo);
		this.angle+= calc;
		
	}else if (this.angle > angulo_player_enemigo){
	
		calc = this.angle-angulo_player_enemigo;
	//	trace("diferencia - " + calc);
	this.angle-= calc;
		
	}
	
	Persecucion();
	//for (ib in 0...arrayBalasB.length)
//{
	////balaC.x -= velocidadBalaC * proporcionX;
	////balaC.y -= velocidadBalaC * proporcionY;
	//
	//arrayBalasB[ib].MoverBala(1, 0);
	//
	//if (arrayBalasB[ib].x < 0){
		//arrayBalasB[ib].DestruccionBala();
		//arrayBalasB.remove(arrayBalasB[ib]);
		//
		//
	//}
	
	
		
//}	
	
DisparoB();
	}
	public function LimiteEscenario():Void{
		
		if (this.x < 0){
		x = FlxG.width;
	ProporcionPersecucion = 1;
		//	destroy();
		}
	}
	
	public function ObtencionCoordenadasJugador(x_jugador:Float,y_jugador:Float){
	
		 coord_playerX= x_jugador;
		coord_playerY = y_jugador;
	
		
		//trace("posicion jugador x:" +coord_playerX);
	//	trace("posicion jugador y:" +coord_playerY);
		
	}
	public function Persecucion(){
		distanciaPersecucion =coord_playerX+anchoPlayer*5 ;
		//trace("coord x jugador: " + coord_playerX);
		
	//	trace("distanciaPersecucion: " + distanciaPersecucion);
//trace("prop " + ProporcionPersecucion);
		if (this.x <= distanciaPersecucion)
		{
			//trace("persiguiendo!!");
		ProporcionPersecucion = 3;
			
		}
		
	}
	
	
	
	public function ObtencionAngulo(_angulo:Float){	
	
			angulo_player_enemigo = _angulo;
	
			
	}
	public function ObtencionAnchoPlayer(_ancho:Float){
		
	anchoPlayer = _ancho;
		//trace("ancho jugador " + anchoPlayer);
	}

	public function DisparoB(){
	//	trace("TIEMPO "+tiempoDisparo.currentCount);
		if(bulletB!=null){
		//
		//
		
		 bulletB.MoverBala(1, 0);
	 if(bulletB.x<0){
		 bulletB.destroy();
		bulletB = null;
		 
	 }
		
		}
	
	
	if (tiempoDisparo.currentCount > fireRateC&&bulletB==null){
		
		bulletB = new Bullet(0, 0,null, -1, -1, velocidadBalaB);
		bulletB.x = this.x;
		bulletB.y = this.y;
		
		FlxG.state.add(bulletB);
		
		//FlxG.state.add(bulletB);
		//arrayBalasB.push(bulletB);
		tiempoDisparo.reset();
		
		tiempoDisparo.start();
	        }
	
       }


}