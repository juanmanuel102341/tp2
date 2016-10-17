package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
 import flash.utils.Timer;
import flixel.group.FlxGroup.FlxTypedGroup;
	import flixel.FlxState; 
/**
 * ...
 * @author ...
 */
class Boss extends FlxSprite
	{private var tiempoDisparo:Timer=new Timer(1000);
		public var velocidadBoss:Float = 4.5;
		private var direccionMovimiento:Int =-1;
		public var velocidadBala:Int = 5;
		public var bulletJefe:Bullet;
		public var fireRateJefe:Float = 1.5;
	
		public var grupoBalas:FlxTypedGroup<Bullet>;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		grupoBalas = new FlxTypedGroup<Bullet>(); 
	
		tiempoDisparo.start();
trace("widt jefe "+this.width);
	}
	override public function update(elapsed:Float):Void
		
	{
	
		super.update(elapsed);
		
		
	
		MovimientoJefe();
		DisparoJefe();
		MoverBalasJefe();
	}

	public function MovimientoJefe(){
	//	trace("pos x jefe " + this.x);
		//trace("posy jefe "+this.y);
		
		this.y += velocidadBoss * direccionMovimiento;
	if (this.y <-this.height+20||this.y>FlxG.height-this.height){
//	trace("cambio de direccion");
		direccionMovimiento *=-1;
		
	}

		
	}
	
	public function DisparoJefe(){
		if(tiempoDisparo.currentCount>fireRateJefe){
		
				for (i in 0...3)
				{
					if(this.y>-this.height+30&&this.y<FlxG.height-this.height-5){
					//condicion anterior para q n me dispare fuera de pantalla
						switch i
	
				{
					case 0:
						bulletJefe = new Bullet(0,0,null,-1,1,velocidadBala);
				
					bulletJefe.x = this.x;
					bulletJefe.y = this.y+this.height/2;
					
					grupoBalas.add(bulletJefe);
						FlxG.state.add(bulletJefe);
					case 1:
					
					bulletJefe = new Bullet(0,0,null,-1,1,velocidadBala);
				
					bulletJefe.x = this.x;
					bulletJefe.y = this.y + this.height/2+5;
					
					grupoBalas.add(bulletJefe);
					FlxG.state.add(bulletJefe);
					case 2:
						bulletJefe = new Bullet(0,0,null,-1,1,velocidadBala);
						bulletJefe.x = this.x;
						bulletJefe.y = this.y + this.height/2+10;
							
						grupoBalas.add(bulletJefe);
						FlxG.state.add(bulletJefe);
				}
					
					
				
						tiempoDisparo.reset();
						tiempoDisparo.start();
				
				}
				}
	
	
		}
	}

	public function MoverBalasJefe(){
		for (i in 0...grupoBalas.length)
	{	
		//trace("mbj");
		var auxBala:Bullet;
		auxBala = grupoBalas.members[i];
		
		auxBala.MoverBala(1, 0);
		
		  
		}
	}
	
	}