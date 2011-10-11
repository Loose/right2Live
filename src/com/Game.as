package com 
{
	import com.backdrops.Background;
	import com.backdrops.Wall;
	import com.entities.characters.Character;
	import com.entities.characters.enemies.zombies.ZombieBasic;
	import com.entities.characters.enemies.zombies.ZombieFast;
	import com.entities.characters.players.Player;
	import com.entities.Cursor;
	import com.entities.weapons.Shotgun;
	import com.hud.Health;
	import com.menus.Menu;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Game extends World 
	{
		public var ready:Boolean;
		public var level:Level;
		public var time:Number = 0;
		
		public var backdrop:Background;
		public var wall:Wall;
		
		public var zombieTest:ZombieBasic;
		public var zombieFast:ZombieFast;
		
		public function Game() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			ready = false;
			
			setEntities();
			startGame();
			
			Registry.setKeys();
		}
		
		override public function update():void
		{
			time += FP.elapsed;
			
			super.update();
			
			if (Input.pressed("pause"))
			{
				//pause(); /* Doesn't unpause */
			}
			
			if (Input.pressed("reset"))
			{
				FP.world = new Game();
			}
			
			cameraFollow();
			offScreen();
			
			debug();
			
			if (Registry.player.dead)
			{
				gotoMenu();
			}
		}
		
		public function pause():void
		{
			if (!active)
			{
				active = true;
			}
			else
			{
				active = false;
			}
		}
		
		public function setEntities():void
		{
			Registry.cursor = new Cursor();
			add(Registry.cursor);
			
			Registry.player = new Player(20, 20);
			add(Registry.player);
			
			Registry.playerHealth = new Health();
			add(Registry.playerHealth);
			
			zombieTest = new ZombieBasic(300, 60);
			add(zombieTest);
			zombieFast = new ZombieFast(300, 360);
			add(zombieFast);
		}
		
		public function startGame():void
		{
			ready = true;
			level = new Level(Registry.currentLevel);
			Registry.levelWidth = level.width;
			Registry.levelHeight = level.height;
			add(level);
			addBackdrop(Registry.currentLevel);
		}
		
		public function endGame():void
		{
			ready = false;
		}
		
		public function cameraFollow():void
		{
			camera.x += (Registry.player.x - FP.halfWidth) - FP.camera.x;
			camera.y += (Registry.player.y - FP.halfHeight) - FP.camera.y;
			FP.clampInRect(camera, 0, 0, level.width - FP.width, level.height - FP.height - 5);
		}
		
		public function addBackdrop(level:Number):void
		{
			level = Registry.currentLevel;
			
			switch(level)
			{
				case 0:
					backdrop = new Background("city");
					wall = new Wall("city");
				break;
			}
			
			addGraphic(backdrop, Registry.LAYER_BG);
			add(wall);
		}
		
		public function offScreen():void
		{
			if (Registry.player.y > Registry.levelHeight)
			{
				repositionPlayer();
			}
		}
		
		public function repositionPlayer():void
		{
			Registry.playerHealth.modifyHealth( -1);
			Registry.player.x = 20;
			Registry.player.y = 20;
		}
		
		public function gotoMenu():void
		{
			FP.world = new Menu();
		}
		
		public function debug():void
		{
			FP.log(zombieTest.seenPlayer);
		}
	}

}