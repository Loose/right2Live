package  
{
	import com.entities.characters.players.Player;
	import com.entities.Cursor;
	import com.hud.Health;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Loose
	 */
	public class Registry 
	{
		public static const CONSOLE:Number = 0;
		public static var love:Number = 0;
		
		/* Credits */
		public static const CREATOR:String = "- Black Magic -";
		[Embed(source = 'ass/blackMagicSans.png')] public static const LOGO:Class;
		
		/* Game */
		public static const TITLE:String = "Right 2 Live";
		public static const WIDTH:Number = 320;
		public static const HEIGHT:Number = 240;
		public static const COLOR:uint = 0x85878F;
		public static var currentLevel:Number = 0;
		
		/* Menu */
		public static var barsClosed:Boolean = true;
		
		/* Keys */
		[Embed(source = 'ass/help/mouse40x40.png')] public static const KEY_MOUSE:Class;
		[Embed(source = 'ass/help/wasd40x40.png')] public static const KEY_WASD:Class;
		[Embed(source = 'ass/help/e40x40.png')] public static const KEY_E:Class;
		[Embed(source = 'ass/help/p40x40.png')] public static const KEY_P:Class;
		
		/* Globals */
		public static const GLOBAL_FPS:Number = 7;			// 7
		public static const GLOBAL_JUMP:Number = -4.4;		//-4.4
		public static const GLOBAL_GRAVITY:Number = 0.2;	// 0.2
		public static const GLOBAL_ACCEL:Number = 0.2;		// 0.2
		
		public static const GLOBAL_HORT:Number = 1.6;		// 1.6
		public static const GLOBAL_VERT:Number = 6;			// 6
		
		/* Characters */
		[Embed(source = 'ass/XMCharacter.xml', mimeType = 'application/octet-stream')] public static const XML_CHAR:Class;
		
		/* Players */
		public static var player:Player;
		public static var playerHealth:Health;
		[Embed(source = 'ass/preview/player11x20.png')] public static const TEMP_PLAYER:Class;
		
		/* Health */
		[Embed(source = 'ass/hud/healthContain51x10.png')] public static const HEALTH_CONTAIN:Class;
		[Embed(source = 'ass/hud/healthPoint12x8.png')] public static const HEALTH_POINT:Class;
		
		/* Cursor */
		public static var cursor:Cursor;
		[Embed(source = 'ass/entities/cursor5x5.png')] public static const IMG_CURSOR:Class;
		
		/* Tiles */
		public static const TILE_SIZE:Number = 10;
		[Embed(source = 'ass/tiles/building10x10.png')] public static const TILE_BUILDING:Class;
		
		/* Levels */
		public static var levelWidth:Number;
		public static var levelHeight:Number;
		
		[Embed(source = 'ass/levels/TestSquares.oel', mimeType = 'application/octet-stream')] public static const LEVEL_SQUARES:Class;
		[Embed(source = 'ass/levels/TestWall.oel', mimeType = 'application/octet-stream')] public static const LEVEL_WALL:Class;
		[Embed(source = 'ass/levels/TestNew.oel', mimeType = 'application/octet-stream')] public static const LEVEL_NEW:Class;
		
		/* Backdrops */
		[Embed(source = 'ass/backdrops/buildingLite240x1000.png')] public static const BD_BUILD_L:Class;
		[Embed(source = 'ass/backdrops/buildingMid300x1000.png')] public static const BD_BUILD_M:Class;
		[Embed(source = 'ass/backdrops/buildingDark250x1000.png')] public static const BD_BUILD_D:Class;
		
		[Embed(source = 'ass/backdrops/cloudLit18x120.png')] public static const BD_CLOUD_L:Class;
		[Embed(source = 'ass/backdrops/cloudMid60x120.png')] public static const BD_CLOUD_M:Class;
		[Embed(source = 'ass/backdrops/cloudDark60x120.png')] public static const BD_CLOUD_D:Class;
		
		/* Wall */
		[Embed(source = 'ass/backdrops/walls/building20x20.png')] public static const WALL_BUILD:Class;
		
		/* Weather */
		[Embed(source = 'ass/backdrops/weather/rain1x2.png')] public static const WEATHER_RAIN:Class;
		
		/* Types */
		public static const TYPE_CHARACTER:String = "character";
		public static const TYPE_PLAYER:String = "player";
		public static const TYPE_ENEMY:String = "enemy";
		public static const TYPE_CURSOR:String = "cursor";
		
		public static const TYPE_WEAPON:String = "weapon";
		
		public static const TYPE_BULLET:String = "bullet";
		public static const TYPE_HEAL:String = "heal";
		
		public static const TYPE_SOLID:String = "solid";
		public static const TYPE_OBJECT:String = "object";
		
		/* Layers */	/* The higher, the deeper */
		public static const LAYER_HUD:Number = 0;
		public static const LAYER_TEXT:Number = 100;
		
		public static const LAYER_CURSOR:Number = 150;
		
		public static const LAYER_WEATHER:Number = 200;
		public static const LAYER_EFFECT:Number = 300;
		
		public static const LAYER_ITEM:Number = 400;
		
		public static const LAYER_WEAPON:Number = 450;
		public static const LAYER_PLAYER:Number = 500;
		public static const LAYER_ENEMY:Number = 700;
		public static const LAYER_BOSS:Number = 800;
		
		public static const LAYER_BULLET:Number = 900;
		
		public static const LAYER_PLATFORM:Number = 1000;
		public static const LAYER_OBJECT:Number = 1200;
		public static const LAYER_WALL:Number = 1500;
		public static const LAYER_BG:Number = 2000;
		
		public function Registry() 
		{
			
		}
		
		public static function setKeys():void
		{
			Input.define("left", Key.A, Key.LEFT);
			Input.define("right", Key.D, Key.RIGHT);
			Input.define("up", Key.W, Key.UP);
			Input.define("down", Key.S, Key.DOWN);
			Input.define("action", Key.E);
			Input.define("pause", Key.P);
			Input.define("reset", Key.R);
		}
		
	}

}