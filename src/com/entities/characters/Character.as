package com.entities.characters 
{
	import com.entities.weapons.Weapon;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Character extends Entity 
	{
		public var distanceX:Number;
		
		public var jumpPower:Number = 1;
		public var currentHort:Number = 0;
		public var currentVert:Number = 0;
		public var maxHort:Number = 1;
		public var maxVert:Number = 1;
		
		public var movingLeft:Boolean;
		public var movingRight:Boolean;
		public var jumping:Boolean;
		public var health:Number;
		public var destroyed:Boolean;
		public var dead:Boolean = false;
		
		public var sprite:Sprite;
		
		public var xml:XML = FP.getXML(Registry.XML_CHAR);
		
		/**
		 * xml.players."player", xml.enemies."enemy"
		 */
		public var xmlList:XMLList = null;
		
		public var name:String;
		
		public var skin:String;
		public var eyes:String;
		public var hair:String;
		public var chest:String;
		public var legs:String;
		
		public var hat:String;
		public var face:String;
		public var back:String;
		
		public var holding:Boolean;
		public var weapon:Weapon;
		
		public function Character(posX:Number = 0, posY:Number = 0)
		{
			super(x, y);
			
			sprite = new Sprite();
			sprite.character = this;
			graphic = sprite;
		}
		
		override public function added():void 
		{
			super.added();
			
			if (xmlList)
			{
				getCharacter();
				buildCharacter();
				sprite.setParent();
			}
			if (sprite)
			{
				graphic = sprite;
			}
			
			//traceTest();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (originX)
			{
				distanceX = x - originX;
			}
			
			orientUpper();
			moveVertical();
			
			moveBy(currentHort, currentVert, Registry.TYPE_SOLID);
			
			if (world)
			{
				FP.clampInRect(this, 0, 0, Registry.levelWidth - width, Registry.levelHeight + height + 30);
			}
			
			if (health <= 0)
			{
				dead = true;
			}
			
			if (weapon)
			{
				weapon.movement();
			}
		}
		
		public function traceTest():void
		{
			trace("Name", name);
			
			trace("Skin", skin);
			trace("Eyes", eyes);
			trace("Hair", hair);
			trace("Chest", chest);
			trace("Legs", legs);
			
			trace("Hat", hat);
			trace("Face", face);
			trace("Back", back);
			
		}
		
		public function getCharacter():void
		{
			name = xmlList.@name;
			
			skin = xmlList.@skin;
			eyes = xmlList.@eyes;
			hair = xmlList.@hair;
			chest = xmlList.@chest;
			legs = xmlList.@legs;
			
			hat = xmlList.@hat;
			face = xmlList.@face;
			back = xmlList.@back;
		}
		
		/* Get info from an XML to build the character */
		public function buildCharacter():void
		{
			sprite.charName = name;
			sprite.setSkin(skin);
			sprite.setEyes(eyes);
			sprite.setHair(hair);
			sprite.setChest(chest);
			sprite.setLegs(legs);
			sprite.setFace(face);
			
			sprite.makeSprite();
		}
		
		public function moveRight():void
		{
			sprite.flipLower(false);
			
			if (currentHort < Registry.GLOBAL_HORT * maxHort)
			{
				currentHort += Registry.GLOBAL_ACCEL;
			}
			else
			{
				currentHort = Registry.GLOBAL_HORT * maxHort;
			}
		}
		
		public function moveLeft():void
		{
			sprite.flipLower(true);
			
			if (currentHort > -Registry.GLOBAL_HORT * maxHort)
			{
				currentHort -= Registry.GLOBAL_ACCEL;
			}
			else
			{
				currentHort = -Registry.GLOBAL_HORT * maxHort;
			}
		}
		
		public function moveVertical():void
		{
			if (!collide(Registry.TYPE_SOLID, x, y + 1))
			{
				if (currentVert < Registry.GLOBAL_VERT * maxVert)
				{
					currentVert += Registry.GLOBAL_GRAVITY;
				}
				else
				{
					currentVert = Registry.GLOBAL_VERT * maxVert;
				}
				if (collide(Registry.TYPE_SOLID, x, y - 1))
				{
					currentVert = 0.1;
				}
			}
			else
			{
				currentVert = 0;
				if (jumping)
				{
					currentVert += Registry.GLOBAL_JUMP * jumpPower;
					jumping = false;
				}
			}
		}
		
		public function orientUpper():void
		{
			if (FP.world.mouseX < x)
			{
				sprite.flipUpper(true);
			}
			else if (FP.world.mouseX >= x)
			{
				sprite.flipUpper(false);
			}
		}
		
		public function pickWeapon():void
		{
			if (!holding && collide(Registry.TYPE_WEAPON, x, y))
			{
				setWeapon();
			}
		}
		
		public function dropWeapon():void
		{
			if (weapon)
			{
				weapon.character = null;
				weapon = null;
			}
		}
		
		public function setWeapon():void
		{
			weapon = collide(Registry.TYPE_WEAPON, x, y) as Weapon;
			weapon.character = this;
		}
		
		public function destroy():void
		{
			if (!destroyed)
			{
				destroyed = true;
			}
			
			/* kill effect */
			world.remove(this);
		}
		
		public function get onSolid():Entity
		{
			return collide(Registry.TYPE_SOLID, x, y + 1);
		}
	}

}