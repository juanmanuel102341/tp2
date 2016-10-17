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
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flash.utils.Timer;

class MenuState extends FlxState
{
	
	private var timerSpawnHeroe:Timer=new Timer(1000);
	var jugador:Player;
	var enemigo_A:Enemigos_A;
	public var ColeccionA :Array<Enemigos_A>;
	
	
	public var ColeccionA_2 :FlxTypedGroup<Enemigos_A>;//mov sinusoide estandar
	public var coleccionB_2:FlxTypedGroup<Enemigos_B>;//kamikace
	public var coleccionC_2:FlxTypedGroup<Enemigo_C>;//torre
	//public var BossFinalLeve:FlxTypedGroup<
	
	public var collecionIsla:FlxTypedGroup<FlxSprite>;
	
	public var player_01:FlxTypedGroup<Player>;
	public var jefe_level:FlxTypedGroup<Boss>;
	
	
	var enemigo_B:Enemigos_B;
	public var ColeccionB:Array<Enemigos_B>;
	var enemigo_c:Enemigo_C ;
	public var ColeccionC:Array<Enemigo_C>;
	var d:Float;
	var a:Float;
	var dist_c:Int;
	
	public var nivel_arena:FlxTilemap;
	public var nivel_agua:FlxTilemap;
	public var nivel_isla:FlxTilemap;
	public var elementosLevel:FlxTilemap;
	
	public var galeon_player:FlxTilemap;
	public var kamikase:FlxTilemap;
	public var pirata:FlxTilemap;
	public var torre:FlxTilemap;
	
	
	private var level_P:FlxTilemap;
	
	public var loader:FlxOgmoLoader;
	//private var nivel:FlxTilemap;
		private var player:FlxSprite;
		
		public var obj_aux_A:Enemigos_A;
		
		public var obj_aux_C:Enemigo_C;
		public var obj_auxBalasPlayer:Bullet;
		public var objChoque:FlxSprite;
		var posxPlayer:Float;
		var posyPlayer:Float;
		
		
		override public function create():Void
	{
		
		super.create();
		collecionIsla = new FlxTypedGroup<FlxSprite>();
		
		ColeccionA_2 = new FlxTypedGroup<Enemigos_A>();
		player_01 = new FlxTypedGroup<Player>();
		coleccionB_2 = new FlxTypedGroup<Enemigos_B>();	
		coleccionC_2 = new FlxTypedGroup<Enemigo_C>();
		jefe_level = new FlxTypedGroup<Boss>();
		CargaLevel();
	
	
		//*******************player************************
	
	add(player_01);
	
	//*****************enemigo sinusoide********************
	add(ColeccionA_2);

		add(coleccionB_2);
	add(coleccionC_2);	
	
	add(jefe_level);
	//*****************enemigo sinusoide********************

	
	//for (i_1 in 3){
//	trace("index"+i_1);


	//*****************enemigo Kamikaze********************
//ColeccionB = new Array<Enemigos_B>();
	//CreateEnemyB();
	//
	//*****************enemigo torreta********************
	
	//enemigo_c= new Enemigo_C();
	//enemigo_c.ObtencionCoordenadasJugador_c(jugador.x, jugador.y);
    //dist_c=FlxMath.distanceBetween(jugador, enemigo_c);
//
	//FlxG.state.add(enemigo_c);
	
	

		add(collecionIsla);
	
	FlxG.camera.follow(player_01.getFirstAlive());
		//FlxG.camera.setScrollBounds(player_01.getFirstAlive().x,player_01.getFirstAlive().y,5000,240);
	
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//**********contacto player con enemigo pirata sinusoidal **********************88
			if(player_01.countLiving()>0){
		
				for (i_a in 0...ColeccionA_2.members.length) 
				{
			
				obj_aux_A = ColeccionA_2.members[i_a];
				obj_aux_A.ContactoPlayerEnemigoA(player_01.getFirstAlive());// contacto balas enemigo A player
			//	ContactoBalasPlayer_Enemigo_A(obj_aux_A);//contacto balas player enemigo A
					
					//*************************contacto balas jugador con enemigo A*******************8
					for (iA in 0...player_01.getFirstAlive().ArrayBalas.length)
					{
				
					 obj_auxBalasPlayer=player_01.getFirstAlive().ArrayBalas.members[iA];
				
						 if (obj_auxBalasPlayer.overlaps(obj_aux_A))
						 {
							 
							 //trace("muerte A!!!");
							obj_auxBalasPlayer.kill();
							 obj_aux_A.kill();
							
						 }
					
					
					}	
				}
			}
	
			//****************enemigo Kamikaze********************
		//****ontacto player con enemigo kamikace ****************			
		
			//**********contacto enemigo torreta player**********************88
			if(player_01.countLiving()>0){
		
				for (i_c in 0...coleccionC_2.members.length) 
				{
			
			obj_aux_C = coleccionC_2.members[i_c];
			obj_aux_C.ContactoPlayerEnemigoC(player_01.getFirstAlive());
			
			
				}
			}	
			
			
	
		if (player_01.countLiving() > 0){	
		FlxG.overlap(player_01.getFirstAlive().ArrayBalas, coleccionB_2, ContactoBalasPlayer_Enemigo_B);
		}
		
		
		//if (FlxG.collide(player_01.getFirstAlive().ArrayBalas, coleccionB_2)){
			////trace("contacto b");
		//
			//
			//
		//}
		//
		if(player_01.countLiving()>0){
	for (i in 0...coleccionB_2.countLiving()){							
				
		var obj_aux_B:Enemigos_B;
				
			obj_aux_B = coleccionB_2.members[i];
		obj_aux_B.ObtencionCoordenadasJugador(player_01.getFirstAlive().coordenadasJugadorX,player_01.getFirstAlive().coordenadasJugadorY);
					
					a=FlxAngle.angleBetween(player_01.getFirstAlive(),obj_aux_B,true);
						////
					obj_aux_B.ObtencionAngulo(a);
					////
					obj_aux_B.ObtencionAnchoPlayer(player_01.getFirstAlive().width);
					////
						
					obj_aux_B.ContactoPlayerEnemigoB(player_01.getFirstAlive());
		
	
					
					if (obj_aux_B.overlaps(player_01.getFirstAlive())){
					 
			//	 trace("kamikaze!!!");
					 
				 }else{
				 
			}
		
		
			}
	
	
		}	
	
	//********************************************enemigo torreta********************
	if(player_01.countLiving()>0){	
		
		for (i2 in 0...coleccionC_2.members.length) 
		{
			obj_aux_C = coleccionC_2.members[i2];
			
			obj_aux_C.ObtencionCoordenadasJugador_c(player_01.getFirstAlive().x, player_01.getFirstAlive().y);
			var dis_c:Float;
			dist_c=FlxMath.distanceBetween(player_01.getFirstAlive(), obj_aux_C);
			obj_aux_C.ObtencionDistancia(dist_c);
			
	
	
			
		}
	
	FlxG.overlap(player_01.getFirstAlive().ArrayBalas, coleccionC_2, ContactoBalasPlayer_Enemigo_C);
		
		
	}
	//*********************contacto isla*******************************
	if(player_01.countLiving()>0){
			//if (player_01.getFirstAlive().overlaps(collecionIsla)){
	
		//trace("contacto elementos");
		posxPlayer = player_01.getFirstAlive().x;
		posyPlayer = player_01.getFirstAlive().y;
	//if(FlxG.collide(player_01.getFirstAlive(),collecionIsla))
	//{
		//
	//}
		FlxG.overlap(player_01.getFirstAlive(), collecionIsla, contactoIsla);
		//trace("muerte isla");
	//player_01.getFirstAlive().kill();
	//timerSpawnHeroe.start();
			}

		
	
			
			
	
	
		SpawnHeroe();
		
	}
		
		public function CargaLevel(){
	
			loader = new FlxOgmoLoader(AssetPaths.gwLevel_v1beta__oel);
				
		//nivel_isla = new FlxTilemap();
		nivel_agua = loader.loadTilemap(AssetPaths.agua_v1__png, 16, 16, "agua");
		
		
		elementosLevel = loader.loadTilemap(AssetPaths.elementos_v1__png, 16, 16, "elementos");
		
		nivel_isla = loader.loadTilemap(AssetPaths.isla_v1__png, 16, 16, "isla");
	
				
		loader.loadEntities(ponerEntidades, "entidades");
	

		FlxG.worldBounds.set(0, 0,nivel_agua.width, nivel_agua.height);
		////
//FlxG.collide(nivel_isla);		
	nivel_agua.setTileProperties(0, FlxObject.NONE);
	nivel_agua.setTileProperties(1, FlxObject.NONE);
//	FlxG.collide(player_01.getFirstAlive(), nivel_isla);

//nivel_isla.setTileProperties(0, FlxObject.NONE);
//nivel_isla.setTileProperties(1, FlxObject.ANY);

	//nivel_isla.setTileProperties(2, FlxObject.ANY);
//nivel_isla.setTileProperties(3, FlxObject.ANY);
////nivel_isla.setTileProperties(2, FlxObject.ANY);
//nivel_isla.setTileProperties(3, FlxObject.ANY);
	//
	//nivel_arena.setTileProperties(0, FlxObject.ANY);
	//nivel_arena.setTileProperties(1, FlxObject.ANY);
	//level_P.setTileProperties(2, FlxObject.ANY);
	////
		//FlxG.state.add(nivel_arena);
	//	FlxG.state.add(nivel_agua);
		//FlxG.state.add(nivel_pasto);

//nivel_isla.setTileProperties(1, FlxObject.ANY);
		
		add(nivel_agua);
////nivel_agua=new FlxTiledMapAsset(AssetPaths.
		add(nivel_isla);
	
		//add(elementosLevel);
	
		//jugador = new Player();

		//add(pirata);
		//add(galeon_player);
		//add(torre);
		//add(kamikase);
		//camera.follow(jugador);
		//FlxG.state.add(jugador);
		//FlxG.camera.follow(jugador);
	
		
		

	}
	
	
	
	

	
	private function ponerEntidades(nombreEntidad:String, datosEntidad:Xml):Void
	{
			var X:Float = Std.parseFloat(datosEntidad.get("x"));
			var Y:Float = Std.parseFloat(datosEntidad.get("y"));
		if (nombreEntidad == "player")
		{
		trace("player");
		var player:Player = new Player(X, Y);
		player.loadGraphic(AssetPaths.galleon_v2__png);
	
		player_01.add(player);	
		}
		
		if (nombreEntidad == "pirata")
		{trace("pirata");
			var e:Enemigos_A = new Enemigos_A(X, Y);
			e.loadGraphic(AssetPaths.pirate_v2__png);
			ColeccionA_2.add(e);
		}
		
		if (nombreEntidad == "colision4"){
		trace("isla");
			var isla_c:FlxSprite = new FlxSprite(X, Y);
			isla_c.loadGraphic(AssetPaths.colision_v5__png);
			
			
		//	isla_c.makeGraphic(16, 16, FlxColor.GREEN);
		collecionIsla.add(isla_c);	
		}
		
		if (nombreEntidad == "kamikase"){
			trace("kamikace");
			var e2:Enemigos_B = new Enemigos_B(X, Y);
			e2.ObtencionCoordenadasJugador(player_01.getFirstAlive().x, player_01.getFirstAlive().y);
			e2.ObtencionAnchoPlayer(player_01.getFirstAlive().width);
			var a:Float;
			a=FlxAngle.angleBetween(player_01.getFirstAlive(),e2,true);
			e2.ObtencionAngulo(a);
			e2.loadGraphic(AssetPaths.kamikase_v1__png);
			coleccionB_2.add(e2);
			
		}
		if (nombreEntidad == "torre"){
		trace("torre");
			var e3:Enemigo_C = new Enemigo_C(X, Y);
			e3.loadGraphic(AssetPaths.torre_v1__png);
			e3.ObtencionCoordenadasJugador_c(player_01.getFirstAlive().x, player_01.getFirstAlive().y);
			var dis_c:Float;
			dist_c=FlxMath.distanceBetween(player_01.getFirstAlive(), e3);
			e3.ObtencionDistancia(dist_c);
			coleccionC_2.add(e3);
			
		}
		
		if (nombreEntidad == "boss"){
			trace("boss");
		var auxJefe:Boss = new Boss(X, Y, AssetPaths.boss_v1__png);
		jefe_level.add(auxJefe);
		
		
			
			
		}
	
		
		}
	
		
		public function SpawnHeroe(){
			
			if (timerSpawnHeroe.currentCount > 2){
				
				timerSpawnHeroe.reset();
				timerSpawnHeroe.stop();
				player_01.revive();
				player_01.getFirstAlive().x = posxPlayer - 50;
				player_01.getFirstAlive().y - posyPlayer - 50;
				
				
			}
		}
		
		public function ContactoBalasPlayer_Enemigo_B(Object_bala:FlxObject, Objecto_enemigo:FlxObject):Void{
			trace("contacto b2");
		Object_bala.kill();
		Objecto_enemigo.kill();
		}
		public function ContactoBalasPlayer_Enemigo_C(Object_bala:FlxObject, Objecto_enemigo:FlxObject):Void{
			trace("contacto c");
		Object_bala.kill();
		Objecto_enemigo.kill();
		}
		public function contactoIsla(Object_bala:FlxObject, Objecto_enemigo:FlxObject):Void{
			trace("contacto isla");
	//	Object_bala.kill();
		//Objecto_enemigo.kill();
		}
}

