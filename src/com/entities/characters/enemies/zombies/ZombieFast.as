package com.entities.characters.enemies.zombies 
{
	import com.entities.characters.enemies.Zombie;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class ZombieFast extends Zombie 
	{
		
		public function ZombieFast(posX:Number, posY:Number) 
		{
			super(posX, posY);
			
			health = 2;
			damage = 1;
			
			xmlList = xml.zombies.Fast;
			
			rangeX = 180;
			rangeY = 80;
			normalHort = 0.6;
			chaseHort = 0.9;
		}
		
	}

}