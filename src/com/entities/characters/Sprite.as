package com.entities.characters 
{
	import com.entities.characters.parts.B_Hand;
	import com.entities.characters.parts.Chest;
	import com.entities.characters.parts.Eyes;
	import com.entities.characters.parts.F_Hand;
	import com.entities.characters.parts.Face;
	import com.entities.characters.parts.Hair;
	import com.entities.characters.parts.Head;
	import com.entities.characters.parts.Legs;
	import com.entities.characters.parts.Part;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Sprite extends Graphiclist 
	{
		public var character:Character;
		public var charName:String;
		
		public var head:Head;
		public var f_hand:F_Hand;
		public var b_hand:B_Hand;
		
		public var eyes:Eyes;
		public var hair:Hair;
		
		public var chest:Chest;
		public var legs:Legs;
		
		public var face:Face;
		
		public function Sprite(name:String = null)
		{
			charName = name;
		}
		
		override public function update():void 
		{
			super.update();
			playAnimations();
		}
		
		public function playAnimations():void
		{
			if (character.currentVert == 0)
			{
				if (character.currentHort != 0)
				{
					legs.play("walk");
					b_hand.play("walk");
					f_hand.play("walk");
				}
				else
				{
					legs.play("idle");
					b_hand.play("idle");
					f_hand.play("idle");
				}
			}
			else
			{
				legs.play("jump");
				b_hand.play("jump");
				f_hand.play("jump");
			}
		}
		
		public function setSkin(value:String):void
		{
			switch(value) {
				case "dead":
					head = new Head(Morgue.HEAD_DEAD);
					f_hand = new F_Hand(Morgue.FHAND_DEAD);
					b_hand = new B_Hand(Morgue.BHAND_DEAD);
				break;
				case "tan":
					head = new Head(Morgue.HEAD_TAN);
					f_hand = new F_Hand(Morgue.FHAND_TAN);
					b_hand = new B_Hand(Morgue.BHAND_TAN);
				break;
			}
		}
		
		public function setEyes(value:String):void
		{
			switch(value) {
				case "black":
					eyes = new Eyes(Morgue.EYES_BLACK);
				break;
				case "blue":
					eyes = new Eyes(Morgue.EYES_BLUE);
				break;
				case "brown":
					eyes = new Eyes(Morgue.EYES_BROWN);
				break;
				case "devil":
					eyes = new Eyes(Morgue.EYES_DEVIL);
				break;
				case "gray":
					eyes = new Eyes(Morgue.EYES_GRAY);
				break;
				case "green":
					eyes = new Eyes(Morgue.EYES_GREEN);
				break;
				case "hazel":
					eyes = new Eyes(Morgue.EYES_HAZEL);
				break;
				case "mint":
					eyes = new Eyes(Morgue.EYES_MINT);
				break;
				case "pink":
					eyes = new Eyes(Morgue.EYES_PINK);
				break;
				case "purple":
					eyes = new Eyes(Morgue.EYES_PURPLE);
				break;
				case "red":
					eyes = new Eyes(Morgue.EYES_RED);
				break;
				case "sky":
					eyes = new Eyes(Morgue.EYES_SKY);
				break;
				case "white":
					eyes = new Eyes(Morgue.EYES_WHITE);
				break;
			}
		}
		
		public function setHair(value:String):void
		{
			switch(value) {
				case "any":
					hair = new Hair(Morgue.HAIR_ANY);
				break;
				case "brain":
					hair = new Hair(Morgue.HAIR_BRAIN);
				break;
				case "loose":
					hair = new Hair(Morgue.HAIR_LOOSE);
				break;
				case "wesker":
					hair = new Hair(Morgue.HAIR_WESKER);
				break;
			}
		}
		
		public function setChest(value:String):void
		{
			switch(value) {
				case "f_sky":
					chest = new Chest(Morgue.CHEST_F_SKY);
				break;
				
				case "m_black":
					chest = new Chest(Morgue.CHEST_M_BLACK);
				break;
				case "m_blue":
					chest = new Chest(Morgue.CHEST_M_BLUE);
				break;
				case "m_gray":
					chest = new Chest(Morgue.CHEST_M_GRAY);
				break;
				case "m_green":
					chest = new Chest(Morgue.CHEST_M_GREEN);
				break;
				case "m_red":
					chest = new Chest(Morgue.CHEST_M_RED);
				break;
				case "m_white":
					chest = new Chest(Morgue.CHEST_M_WHITE);
				break;
			}
		}
		
		public function setLegs(value:String):void
		{
			switch(value) {
				case "khaki":
					legs = new Legs(Morgue.LEGS_KHAKI);
				break;
				case "jeans":
					legs = new Legs(Morgue.LEGS_JEANS);
				break;
			}
		}
		
		public function setFace(value:String):void
		{
			switch(value) {
				case "blackframe":
					face = new Face(Morgue.FACE_BLACKFRAME);
				break;
				case "eyepatch":
					face = new Face(Morgue.FACE_EYEPATCH);
				break;
				case "sunglasses":
					face = new Face(Morgue.FACE_SUNGLASSES);
				break;
				
				
				case "blackbeard":
					face = new Face(Morgue.FACE_BLACKBEARD);
				break;
				
				default:
					face = new Face(Morgue.FACE_BLANK);
				break;
			}
		}
		
		public function makeSprite():void
		{
			/* FILO */
			add(b_hand);
			add(legs);
			add(chest);
			add(head);
			add(eyes);
			add(face);
			add(hair);
			add(f_hand);
		}
		
		public function flipUpper(side:Boolean):void
		{
			head.flipped = side;
			hair.flipped = side;
			eyes.flipped = side;
			chest.flipped = side;
			face.flipped = side;
		}
		
		public function flipLower(side:Boolean):void
		{
			legs.flipped = side;
			b_hand.flipped = side;
			f_hand.flipped = side;
		}
		
		public function setParent():void
		{
			for each(var g:Part in children)
			{
				g as Part;
				g.parent = this;
			}
		}
	}

}