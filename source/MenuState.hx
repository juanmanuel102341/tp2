package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap.FlxTiledMapAsset;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.FlxAssets.FlxGraphicAsset;
import lime.math.Vector2;
import flixel.math.FlxAngle;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
class MenuState extends FlxState
{
	

	var jugador:Player;
	var enemigo_A:Enemigos_A;
	var enemigo_B:Enemigos_B;
	var enemigo_c:Enemigo_C ;
	var d:Float;
	var a:Float;
	var dist_c:Int;
	
	public var nivel_arena:FlxTilemap;
	public var nivel_agua:FlxTilemap;
	public var nivel_isla:FlxTilemap;
	
	private var level_P:FlxTilemap;
	
	public var loader:FlxOgmoLoader;
	//private var nivel:FlxTilemap;
		private var player:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		loader = new FlxOgmoLoader(AssetPaths.lv1__oel);
		
		//nivel_agua = new FlxTilemap();
		//nivel_agua.loadMapFromArray(cast(loader.
		//loader = new FlxOgmoLoader("assets/data/gwLevel_v1.oel");
		//nivel_agua = loader.loadTilemap(AssetPaths.gwLevel_v1__png, 16, 16, "agua");
		//trace("levelito "+nivel_agua);
		////	nivel = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");	
		//nivel_arena = loader.loadTilemap(AssetPaths.gwLevel_v1__png, 16, 16, "arena");
		//nivel_isla = loader.loadTilemap(AssetPaths.gwLevel_v1__png, 16, 16, "isla");
	
		level_P = loader.loadTilemap(AssetPaths.lv1_profe__png, 16, 16, "tiles");
		add(level_P);
		//nivel_agua = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "agua");
		//nivel_pasto = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "isla_pasto");
		//loader.loadEntities(ponerEntidades, "entities");
	
		//FlxG.camera.setScrollBounds(0, level_P.width, 0, level_P.height);
		//FlxG.worldBounds.set(0, 0, level_P.width, level_P.height);
		////
		////level_P.setTileProperties(0, FlxObject.NONE);
		//level_P.setTileProperties(1, FlxObject.NONE);
		//level_P.setTileProperties(2, FlxObject.ANY);
	////
		//FlxG.state.add(nivel_arena);
		//FlxG.state.add(nivel_agua);
		//FlxG.state.add(nivel_pasto);
//nivel_agua.follow();
		//add(nivel_agua);
////nivel_agua=new FlxTiledMapAsset(AssetPaths.
		//add(nivel_arena);
		//add(nivel_isla);
		//jugador = new Player();

		//camera.follow(jugador);
		//FlxG.state.add(jugador);
		//FlxG.camera.follow(jugador);
	
	
	//enemigo_A = new Enemigos_A();
	//
	//FlxG.state.add(enemigo_A);
	//
	//enemigo_B = new Enemigos_B();
	//enemigo_B.ObtencionCoordenadasJugador(jugador.coordenadasJugadorX,jugador.coordenadasJugadorY);
	//FlxG.state.add(enemigo_B);
	//
	//a=FlxAngle.angleBetween(jugador,enemigo_B,true);
	//
	//
	//enemigo_B.ObtencionAngulo(a);
	//enemigo_B.ObtencionAnchoPlayer(jugador.width);
	//
	//enemigo_c= new Enemigo_C();
	//enemigo_c.ObtencionCoordenadasJugador_c(jugador.x, jugador.y);
    //dist_c=FlxMath.distanceBetween(jugador, enemigo_c);
 //trace("dist "+dist_c);
	//FlxG.state.add(enemigo_c);
	
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	//camera.follow(jugador);
		
		
	    //enemigo_B.ObtencionCoordenadasJugador(jugador.coordenadasJugadorX,jugador.coordenadasJugadorY);
//
	//
	//
	//a=FlxAngle.angleBetween(jugador,enemigo_B,true);
		//
	//enemigo_B.ObtencionAngulo(a);
		//
	////if(jugador.bala!=null){
			////jugador.bala.ContactoBala(enemigo_A);
		////}
			////
	//
	//enemigo_c.ObtencionCoordenadasJugador_c(jugador.x, jugador.y);
		//dist_c=FlxMath.distanceBetween(jugador, enemigo_c);
	   ////trace("dist "+dist_c);
		//enemigo_c.ObtencionDistancia(dist_c);
		//
	}
		
	

	public function CargaLevel(){
	//nivel = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");		
		//loader.loadEntities(ponerEntidades, "entities");
		
		//loader = new FlxOgmoLoader(AssetPaths.lv1_profe__oel);
		//level_P = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");
		//
		////	nivel = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");	
		////nivel_arena = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "isla_arena");
		////nivel_agua = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "agua");
		////nivel_pasto = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "isla_pasto");
//
	//
		////FlxG.camera.setScrollBounds(0, level_P.width, 0, level_P.height);
		////FlxG.worldBounds.set(0, 0, level_P.width, level_P.height);
		//////
		////level_P.setTileProperties(0, FlxObject.NONE);
		////level_P.setTileProperties(1, FlxObject.NONE);
		////level_P.setTileProperties(2, FlxObject.ANY);
	//////
		////FlxG.state.add(nivel_arena);
		////FlxG.state.add(nivel_agua);
		////FlxG.state.add(nivel_pasto);
//
		//FlxG.state.add(level_P);
		
	}
	//private function ponerEntidades(nombreEntidad:String, datosEntidad:Xml):Void
	//{
		//if (nombreEntidad == "player")
		//{
			//
			////var X:Float = Std.parseFloat(datosEntidad.get("x"));
			////var Y:Float = Std.parseFloat(datosEntidad.get("y"));
		////	var jugador:FlxSprite;
			////jugador=datosEntidad
			////player = new FlxSprite(X, Y);
			////player.makeGraphic(16, 16, 0xFF00a0b0);
			////player.velocity.x = 64;
		//}
	//}
	}

