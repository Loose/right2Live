package 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Morgue 
	{
		/**
		 * How to add body parts:
		 * 1. Embed file in Morgue.
		 * 2. Create subclass extended from Part.
		 * 3. Create variable and set function in Sprite.
		 * 4. Add to makeSprite in Sprite.
		 * 6. Add to xxFlip in Sprite.
		 * 6. Add to buildCharacter in Character.
		 * 7. Adjust and offset.
		 */
		
		/* Heads */
		[Embed(source = 'ass/entities/character/head_dead10x8.png')] public static const HEAD_DEAD:Class;
		[Embed(source = 'ass/entities/character/head_tan10x8.png')] public static const HEAD_TAN:Class;
		
		/* Front hand */
		[Embed(source = 'ass/entities/character/fhand_dead16x7.png')] public static const FHAND_DEAD:Class;
		[Embed(source = 'ass/entities/character/fhand_tan16x7.png')] public static const FHAND_TAN:Class;
		
		/* Back hand */
		[Embed(source = 'ass/entities/character/bhand_dead16x7.png')] public static const BHAND_DEAD:Class;
		[Embed(source = 'ass/entities/character/bhand_tan16x7.png')] public static const BHAND_TAN:Class;
		
		/* Eyes */
		[Embed(source = 'ass/entities/character/eyes_black4x2.png')] public static const EYES_BLACK:Class;
		[Embed(source = 'ass/entities/character/eyes_blue4x2.png')] public static const EYES_BLUE:Class;
		[Embed(source = 'ass/entities/character/eyes_brown4x2.png')] public static const EYES_BROWN:Class;
		[Embed(source = 'ass/entities/character/eyes_devil4x2.png')] public static const EYES_DEVIL:Class;
		[Embed(source = 'ass/entities/character/eyes_gray4x2.png')] public static const EYES_GRAY:Class;
		[Embed(source = 'ass/entities/character/eyes_green4x2.png')] public static const EYES_GREEN:Class;
		[Embed(source = 'ass/entities/character/eyes_hazel4x2.png')] public static const EYES_HAZEL:Class;
		[Embed(source = 'ass/entities/character/eyes_mint4x2.png')] public static const EYES_MINT:Class;
		[Embed(source = 'ass/entities/character/eyes_pink4x2.png')] public static const EYES_PINK:Class;
		[Embed(source = 'ass/entities/character/eyes_purple4x2.png')] public static const EYES_PURPLE:Class;
		[Embed(source = 'ass/entities/character/eyes_red4x2.png')] public static const EYES_RED:Class;
		[Embed(source = 'ass/entities/character/eyes_sky4x2.png')] public static const EYES_SKY:Class;
		[Embed(source = 'ass/entities/character/eyes_white4x2.png')] public static const EYES_WHITE:Class;
		
		/* Hair */
		[Embed(source = 'ass/entities/character/hair_any16x18.png')] public static const HAIR_ANY:Class;
		[Embed(source = 'ass/entities/character/hair_brain16x18.png')] public static const HAIR_BRAIN:Class;
		[Embed(source = 'ass/entities/character/hair_loose16x18.png')] public static const HAIR_LOOSE:Class;
		[Embed(source = 'ass/entities/character/hair_wesker16x18.png')] public static const HAIR_WESKER:Class;		
		
		/* Chest */
		[Embed(source = 'ass/entities/character/chestf_sky10x5.png')] public static const CHEST_F_SKY:Class;
		
		[Embed(source = 'ass/entities/character/chestm_black10x5.png')] public static const CHEST_M_BLACK:Class;
		[Embed(source = 'ass/entities/character/chestm_blue10x5.png')] public static const CHEST_M_BLUE:Class;
		[Embed(source = 'ass/entities/character/chestm_gray10x5.png')] public static const CHEST_M_GRAY:Class;
		[Embed(source = 'ass/entities/character/chestm_green10x5.png')] public static const CHEST_M_GREEN:Class;
		[Embed(source = 'ass/entities/character/chestm_red10x5.png')] public static const CHEST_M_RED:Class;
		[Embed(source = 'ass/entities/character/chestm_white10x5.png')] public static const CHEST_M_WHITE:Class;
		
		
		/* Legs */
		[Embed(source = 'ass/entities/character/legs_khaki16x7.png')] public static const LEGS_KHAKI:Class;
		[Embed(source = 'ass/entities/character/legs_jeans16x7.png')] public static const LEGS_JEANS:Class;
		
		/* Face */
		[Embed(source = 'ass/entities/character/face_blank10x8.png')] public static const FACE_BLANK:Class;
		[Embed(source = 'ass/entities/character/face_sunglasses10x8.png')] public static const FACE_SUNGLASSES:Class;
		[Embed(source = 'ass/entities/character/face_eyepatch10x8.png')] public static const FACE_EYEPATCH:Class;
		[Embed(source = 'ass/entities/character/face_blackframe10x8.png')] public static const FACE_BLACKFRAME:Class;
		
		[Embed(source = 'ass/entities/character/face_blackbeard10x14.png')] public static const FACE_BLACKBEARD:Class;
		
		/* Weapons */
		[Embed(source = 'ass/weapons/shotgun20x20.png')] public static const WEAPON_SHOTGUN:Class;
		
		public function Morgue() 
		{
			
		}
		
	}

}