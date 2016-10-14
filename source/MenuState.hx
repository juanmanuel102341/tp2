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
	public var ColeccionA :Array<Enemigos_A>;
	
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
	
	private var level_P:FlxTilemap;
	
	public var loader:FlxOgmoLoader;
	//private var nivel:FlxTilemap;
		private var player:FlxSprite;
		
		public var obj_aux:Enemigos_A;
	
		override public function create():Void
	{
		super.create();
	CargaLevel();
	
	jugador = new Player();
	
	add(jugador);
	//*****************enemigo sinusoide********************
	 ColeccionA = new Array<Enemigos_A>();
	CreateEnemyA();
///trace(ColeccionA.length);
		
		//*****************enemigo sinusoide********************

	
	//for (i_1 in 3){
//	trace("index"+i_1);


	//*****************enemigo Kamikaze********************
ColeccionB = new Array<Enemigos_B>();
	CreateEnemyB();
	
	//*****************enemigo torreta********************
	
	enemigo_c= new Enemigo_C();
	enemigo_c.ObtencionCoordenadasJugador_c(jugador.x, jugador.y);
    dist_c=FlxMath.distanceBetween(jugador, enemigo_c);

	FlxG.state.add(enemigo_c);
	
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
	//*****************enemigo sinusoide********************	

	for(i in 0...ColeccionA.length){
		trace(ColeccionA.length);
		if (ColeccionA[i].x < 0){
			trace("fuera escenario");
	
			obj_aux = ColeccionA[i];
				
			//ColeccionA.remove(ColeccionA[i]);
		
				obj_aux.destroy();
				
			//ColeccionA.remove(ColeccionA[i]);
		
			//ColeccionA[i].destroy();
			//ColeccionA.splice(i, 1);
		
		//FlxG.state.remove(ColeccionA[i]);
	//	trace("index " + i);
		//ColeccionA.splice(i, 1);
		}
		
	}
		for (i_1 in 0...jugador.ArrayBalas.length) 
		{ 
				for (i_2 in 0...ColeccionA.length) 
			{
				if (jugador.ArrayBalas[i_1].overlaps(ColeccionA[i_2]))
				{
				//trace("contaacto a");
				jugador.ArrayBalas[i_1].destroy();
				//
					ColeccionA[i_2].destroy();//fuera enemigo
					
					jugador.ArrayBalas.remove(jugador.ArrayBalas[i_1]);
					ColeccionA.remove(ColeccionA[i_2]);//fuera e d array 
				}
			}
		//
		}
			//for (i_2 in 0...ColeccionA.length) 
			//{
				//if (ColeccionA[i_2].x<0)
				//{
				//trace("spawn a");
				////CreateEnemyA();
				//
				//}
			//}

		
	//*****************enemigo Kamikaze********************	
		for (i in 0...ColeccionB.length) 
		{
	
	ColeccionB[i].ObtencionCoordenadasJugador(jugador.coordenadasJugadorX,jugador.coordenadasJugadorY);
	//
	a=FlxAngle.angleBetween(jugador,ColeccionB[i],true);
		//
	ColeccionB[i].ObtencionAngulo(a);
	//
	ColeccionB[i].ObtencionAnchoPlayer(jugador.width);
	//
	
	//*****************enemigo torreta********************
	enemigo_c.ObtencionCoordenadasJugador_c(jugador.x, jugador.y);
	dist_c=FlxMath.distanceBetween(jugador, enemigo_c);

	enemigo_c.ObtencionDistancia(dist_c);
		}	
	}
		
	

		public function CargaLevel(){
	
			loader = new FlxOgmoLoader(AssetPaths.gwLevel_v1beta__oel);
		
		
		//loader = new FlxOgmoLoader("assets/data/gwLevel_v1.oel");
		nivel_agua = loader.loadTilemap(AssetPaths.agua_v1__png, 16, 16, "agua");
	
		//trace("levelito "+nivel_agua);
		////	nivel = loader.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");	
		nivel_arena = loader.loadTilemap(AssetPaths.arena_v1__png, 16, 16, "arena");
		nivel_isla = loader.loadTilemap(AssetPaths.isla_v1__png, 16, 16, "isla");
	
		//level_P = loader.loadTilemap(AssetPaths.lv1_profe__png, 16, 16, "tiles");
		//add(level_P);
		
		//loader.loadEntities(ponerEntidades, "entities");
	
		//FlxG.camera.setScrollBounds(0, level_P.width, 0, level_P.height);
		//FlxG.worldBounds.set(0, 0, level_P.width, level_P.height);
		////
		////level_P.setTileProperties(0, FlxObject.NONE);
		//level_P.setTileProperties(1, FlxObject.NONE);
		//level_P.setTileProperties(2, FlxObject.ANY);
	////
		//FlxG.state.add(nivel_arena);
	//	FlxG.state.add(nivel_agua);
		//FlxG.state.add(nivel_pasto);

		add(nivel_agua);
////nivel_agua=new FlxTiledMapAsset(AssetPaths.
		add(nivel_arena);
		add(nivel_isla);
		//jugador = new Player();

		//camera.follow(jugador);
		//FlxG.state.add(jugador);
		//FlxG.camera.follow(jugador);
	
		
		

	}
	
	
	
	
	public function CreateEnemyA(){
	
				
	for (i in 0...2) 
	{		
				

		switch(i){
				case 0:
					trace("e1");
					enemigo_A = new Enemigos_A();//enemigo movimiento sinusoide
					enemigo_A.x=FlxG.width;
					enemigo_A.y = FlxG.height / 2;
			enemigo_A.posYinicial =enemigo_A.y;
						
						ColeccionA.push(enemigo_A);
					 
				

				FlxG.state.add(ColeccionA[i]);
					
				case 1:
					trace("e2");
				enemigo_A = new Enemigos_A();//enemigo movimiento sinusoide
				enemigo_A.x=FlxG.width;
				 
				enemigo_A.y =FlxG.height/2+20;
				enemigo_A.posYinicial = enemigo_A.y;
				ColeccionA.push(enemigo_A);
					 
				FlxG.state.add(ColeccionA[i]);
			
				}
	
		
				
				
	}
		
		
	}
	
	public function CreateEnemyB(){
	
	
	
	

				
	for (i in 0...2) 
	{		
	
				
	
		switch(i){
				case 0:
					trace("e1");
					enemigo_B = new Enemigos_B();//enemigo movimiento sinusoide
						
					enemigo_B.x=FlxG.width;
					enemigo_B.y = FlxG.height / 2+10;
					a=FlxAngle.angleBetween(jugador,enemigo_B,true);
					enemigo_B.ObtencionAngulo(a);
					enemigo_B.ObtencionAnchoPlayer(jugador.width);
					enemigo_B.ObtencionCoordenadasJugador(jugador.coordenadasJugadorX,jugador.coordenadasJugadorY);
	//
				
				
				ColeccionB.push(enemigo_B);

				FlxG.state.add(ColeccionB[i]);
					
				case 1:
					trace("e2");
				
					enemigo_B = new Enemigos_B();//enemigo movimiento sinusoide
					enemigo_B.x=FlxG.width;
				 
					enemigo_B.y = FlxG.height / 2-20;
				
					a=FlxAngle.angleBetween(jugador,enemigo_B,true);
					enemigo_B.ObtencionAngulo(a);
					enemigo_B.ObtencionAnchoPlayer(jugador.width);
					enemigo_B.ObtencionCoordenadasJugador(jugador.coordenadasJugadorX,jugador.coordenadasJugadorY);
	//				
					ColeccionB.push(enemigo_B);
					

				FlxG.state.add(ColeccionB[i]);
			
				}
	
		
				
				
	}
		
		
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

