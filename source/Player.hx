package;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import flash.utils.Timer;
import lime.math.Vector2;
//import flixel.system;
import flixel.group.FlxGroup.FlxTypedGroup;
/**
 * ...
 * @author ...
 */
class Player extends FlxSprite

	{	
		public var velocidad:Int=3;
		public var bala:Bullet;
		public var fireRate:Float=2.5;
		private var tiempo:Timer;
		public var disparoActivo:Bool = false; 
		public var vidasPlayer:Int = 3;
		public var coordenadasJugadorX:Float=0;
		public var coordenadasJugadorY:Float=0;
		public var ArrayBalas:FlxTypedGroup<Bullet>;

		public var optionActivo:Bool;
		public var copia_option:Option;
		public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	
		{
	  super(X, Y, SimpleGraphic);
	//this.set_allowCollisions(1);
	  coordenadasJugadorX = this.x;
	  coordenadasJugadorY = this.y;
		tiempo = new Timer(100);
	ArrayBalas = new FlxTypedGroup<Bullet>();
	
		//makeGraphic(25,25,FlxColor.RED);
	
		
	tiempo.start();
	//	trace("hola mundo");
			
	}
	

	override public function update(elapsed:Float):Void
	
{
	
	
	super.update(elapsed);
	//trace("tiempo "+tiempo.currentCount);

	coordenadasJugadorX = this.x;
	  coordenadasJugadorY = this.y;
	Teclas();
//trace("bala p "+ArrayBalas.members.length);

for (i in 0...ArrayBalas.length)
{
	var obj_bala:Bullet;
	obj_bala = ArrayBalas.members[i];
//trace("hola mundo");
	obj_bala.MoverBala(1, 0); 

	if (obj_bala.x > 5000){
	//	trace("muerte bala");
		
		//ArrayBalas.members[i] = null;
		//ArrayBalas.members.splice(i, 1);
	obj_bala.kill();
		//obj_bala.DestruccionBala();
	//obj.DestruccionBala();	
		
	
	}
}


if(optionActivo){

//	creacionOption();
	
	
}
if(copia_option != null){
	
MovimientoOption();
	
}

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
	//if (copia_option != null){
	//copia_option.y+= velocidad;
		//
	//}
	}else if(FlxG.keys.pressed.UP&&this.y>0-10)
	{
			
	y -= velocidad;
	//if (copia_option != null){
	//copia_option.y -= velocidad;
		//
	//}
	}
	if (FlxG.keys.pressed.RIGHT&&this.x<5000-40){
	
		
	x += velocidad;
	if (copia_option != null){
	copia_option.x += velocidad;
		
	}
	}else if (FlxG.keys.pressed.LEFT&&this.x>0){
		
	x -= velocidad;
		//if (copia_option != null){
	//copia_option.x -= velocidad;
		//
	//}
	}
	if (FlxG.keys.justPressed.SPACE&&disparoActivo==false){
    // tiempo.reset();
	tiempo.start();
	disparoActivo = true;
	
//	trace("disparo");
	//tiempo.stop();
		var x_player:Int;
		var y_player:Int; 
		bala = new Bullet(0,0,null,1,1,14);
		bala.x = this.x + this.width / 2 + bala.width;
		bala.y = this.y+this.height/2-bala.height/2;
		ArrayBalas.add(bala);
		FlxG.state.add(bala);
		//optionActivo = true;
			
		}
		
		
		
	
		
	}
	
	public function creacionOption(){
		//creo q habria q ver q va hacia la posicion del jugador osea se desplaza a una cierta velocidad y va para alla, sino pasa lo q me pasa , n hay percepcion d desplazamiento
	copia_option = new Option();
	copia_option.x = this.x + this.width/2;
	copia_option.y = this.y + this.height+5;
	
	FlxG.state.add(copia_option);
	optionActivo = false;
	
	}
	
	public function MovimientoOption(){
		
		//copia_option.x = this.x+this.width;
		//copia_option.y = this.y+this.height;
	}
}