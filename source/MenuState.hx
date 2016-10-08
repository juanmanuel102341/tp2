package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.FlxAssets.FlxGraphicAsset;

class MenuState extends FlxState
{
	var jugador:Player;
	var enemigo:Enemigos_A;
	override public function create():Void
	{
		super.create();
	
	var sprite:FlxSprite;
	
	jugador = new Player();
	add(jugador);
	
	
	enemigo = new Enemigos_A();
	
	add(enemigo);
	//sprite = new FlxSprite();
	
	//add(sprite);
	
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
if(jugador.bala!=null){
	jugador.bala.ContactoBala(enemigo);
}
	
}
		//trace("t");
		
	}

