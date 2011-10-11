package com.entities.characters.players 
{
	import com.entities.characters.Character;
	import com.entities.weapons.Weapon;
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Player extends Character 
	{
		public var maxInvulnerable:Number = 100;
		public var invulnerable:Number = 0;
		
		public function Player(posX:Number, posY:Number)
		{
			super(x, y);
			
			x = posX;
			y = posY;
			health = 4;
			
			if (Registry.love != 0)
			{
				xmlList = xml.players.Any;
			}
			else
			{
				xmlList = xml.players.Loose;
			}
			
			layer = Registry.LAYER_PLAYER;
			type = Registry.TYPE_PLAYER;
			
			setHitbox(10, 18);
			
			Registry.setKeys();
		}
		
		override public function added():void 
		{
			super.added();
		}
		
		override public function update():void 
		{
			if (dead)
			{
				return;
			}
			
			super.update();
			
			invulnerability();
			
			if (Input.pressed("up"))
			{
				jumping = true;
			}
			else
			{
				jumping = false;
			}
			
			if (!collide(Registry.TYPE_SOLID, x, y) && Input.check("right"))
			{
				moveRight();
			}
			else if (!collide(Registry.TYPE_SOLID, x, y) && Input.check("left"))
			{
				moveLeft();
			}
			else
			{
				currentHort = 0;
			}
			
			if (Input.pressed("action"))
			{
				if (collide(Registry.TYPE_WEAPON, x, y) is Weapon)
				{
					if (!weapon)
					{
						FP.log("A weapon!");
						pickWeapon();
					}
					else
					{
						dropWeapon();
					}
				}
				else
				{
					FP.log("Nothing.");
				}
			}
		}
		
		public function invulnerability():void
		{			
			if (invulnerable > 0)
			{				
				invulnerable --;
			}
			else
			{
				invulnerable = 0;
				visible = true;
			}
		}
		
		public function hurt(value:Number):void
		{
			if (invulnerable == 0)
			{
				Registry.playerHealth.modifyHealth(value);
				invulnerable = maxInvulnerable;
			}
		}
	}

}