package com.entities.weapons 
{
	import com.entities.characters.Character;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.PreRotation;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Weapon extends Entity 
	{
		public var character:Character;
		public var image:Class;
		public var sprite:PreRotation;
		public var ranged:Boolean;
		
		public var offset:Number = 0;
		public var adjust:Number = 0;
		
		public var angle:Number;
		public var mirror:Boolean;
		
		public var currentVert:Number;
		
		public var ammo:Number;
		public var ammoSubtract:Number;
		
		public function Weapon(posX:Number = 0, posY:Number = 0)
		{
			super(posX, posY);
			type = Registry.TYPE_WEAPON;
			layer = Registry.LAYER_WEAPON;
			
			if (image)
			{
				sprite = new PreRotation(image);
				sprite.centerOrigin();
				//sprite.originX = 20;
			}
			graphic = sprite;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!character)
			{
				gravity();
				moveBy(0, currentVert, Registry.TYPE_SOLID);
				
				updateGraphic(0);
				sprite.scaleY = 1;
				
				mirror = true;
				mirror = false;
			}
			else
			{
				rotate();
			}
		}
		
		public function movement():void
		{
			if (!mirror)
			{
				x = character.x + offset;
			}
			else
			{
				x = character.x - offset;
			}
			y = character.y + 10;
		}
		
		public function rotate():void
		{
			angle = FP.angle(character.x, character.y, FP.world.mouseX, FP.world.mouseY);
			
			if(angle <= 90 || angle > 270)
			{
				sprite.scaleY = 1;
				mirror = false;
			}
			else
			{
				sprite.scaleY = -1;
				mirror = true;
			}
			
			updateGraphic(angle);
		}
		
		public function updateGraphic(value:Number):void
		{
			sprite.angle = value;
			graphic = sprite;
		}
		
		public function gravity():void
		{
			if (!collide(Registry.TYPE_SOLID, x, y + 1))
			{
				if (currentVert < Registry.GLOBAL_VERT)
				{
					currentVert += Registry.GLOBAL_GRAVITY;
				}
				else
				{
					currentVert = Registry.GLOBAL_VERT;
				}
				if (collide(Registry.TYPE_SOLID, x, y - 1))
				{
					currentVert = 0.1;
				}
			}
			else
			{
				currentVert = 0;
			}
		}
		
		public function adjustGraphic(x:Number, y:Number):void
		{
			graphic.x += x;
			graphic.y += y;
		}
	}
}