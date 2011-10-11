package com.entities.characters.enemies 
{
	import com.entities.characters.Character;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Zombie extends Character 
	{
		public var damage:Number = 0;
		
		public var normalHort:Number = maxHort;
		public var chaseHort:Number = maxHort;
		
		public var playerX:Number;
		public var playerY:Number;
		
		public var rangeX:Number = FP.screen.width * 0.5;
		public var rangeY:Number = FP.screen.height * 0.5;
		
		public var seenPlayer:Boolean = false;
		public var viewX:Number;
		public var viewY:Number;
		
		public function Zombie(posX:Number, posY:Number)
		{
			super(x, y);
			
			x = posX;
			y = posY;
			
			type = Registry.TYPE_ENEMY;
			layer = Registry.LAYER_ENEMY;
			
			setHitbox(10, 18);
		}
		
		override public function update():void 
		{
			getPlayer();
			
			if (seenPlayer)
			{
				chasePlayer();
			}
			else
			{
				maxHort = normalHort;
				currentHort = 0;
			}
			
			collisions();
			
			super.update();
		}
		
		public function getPlayer():void
		{
			if (Registry.player)
			{
				playerX = Registry.player.x;
				playerY = Registry.player.y;
			}
			
			viewX = playerX - x;
			viewY = playerY - y;
			
			if ((viewX > -rangeX && viewX < rangeX) && (viewY > -rangeY && viewY < rangeY))
			{
				seenPlayer = true;
			}
			else
			{
				seenPlayer = false;
			}
		}
		
		public function chasePlayer():void
		{
			maxHort = chaseHort;
			
			if (playerX < x)
			{
				moveLeft();
			}
			else if (playerX >= x)
			{
				moveRight();
			}
		}
		
		public function collisions():void
		{
			var playerHit:Entity = collide(Registry.TYPE_PLAYER, x, y);
			
			if (playerHit)
			{
				//Registry.playerHealth.modifyHealth( -1);
				Registry.player.hurt(-damage);
			}
		}
	}

}