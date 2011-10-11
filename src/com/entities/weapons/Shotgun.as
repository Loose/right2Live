package com.entities.weapons 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Shotgun extends Weapon 
	{
		
		public function Shotgun(posX:Number, posY:Number)
		{			
			image = Morgue.WEAPON_SHOTGUN;
			ranged = true;
			
			super(posX, posY);
			
			offset = 5;
			setHitbox(15, 6);
			setOrigin(-3, -7);
			//adjustGraphic(7, 3);
			//setOrigin(5, 3);
			
			/**
			 * Fix maybe with centerOrigin or OriginXY
			 */
		}
		
	}

}