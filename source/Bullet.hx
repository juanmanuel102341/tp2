package;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Bullet extends FlxSprite
{
	public var velocidadBala:Int;
	private var direccionX:Int;
	private var direccionY:Int;
	
	private var proporcionX:Float;
	private var proporcionY:Float;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset,_direccionX:Int,_dirrecionY:Int,_velocidadBala:Int) 
	{
		velocidadBala = _velocidadBala;
	direccionX = _direccionX;
	direccionY = _dirrecionY;
		super(X, Y, SimpleGraphic);

		makeGraphic(2,5,FlxColor.GREEN);
		
	
		       
	}
	
	override public function update(elapsed:Float):Void
		
	{
		
		super.update(elapsed);

		//trace("m");
	//	MoverBala();
	}
	public function MoverBala(_proporcionX:Float,_proporcionY:Float){    
		
		proporcionX = _proporcionX;
		proporcionY = _proporcionY;
		 
		 
		this.x += velocidadBala*direccionX*proporcionX;
		this.y += velocidadBala * proporcionY*direccionY;
		//DestruccionBala();
	}
	
	public function DestruccionBala(){
	
//	trace("destruccion bala");
		destroy();
	
	}

	public function ContactoBala(obj:FlxSprite):Void
	{
		
		if (this.overlaps(obj)){
			obj.destroy();
			destroy();
		//trace("contacto");
			
		}
	}
}