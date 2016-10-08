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
	private var direccion:Int;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset,_direccion:Int,_velocidadBala:Int) 
	{
		velocidadBala = _velocidadBala;
	direccion = _direccion;
		super(X, Y, SimpleGraphic);

		makeGraphic(20, 5,FlxColor.GREEN);
		
	
		       
	}
	
	override public function update(elapsed:Float):Void
		
	{
		
		super.update(elapsed);

		
		MoverBala();
	}
	public function MoverBala(){    
		
		this.x += velocidadBala*direccion;
	
		DestruccionBala();
	}
	
	public function DestruccionBala(){
	if(this.x>FlxG.width-this.width){	
//	trace("destruccion bala");
		destroy();
	}
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