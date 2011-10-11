package com.entities.characters.enemies.zombies 
{
	import com.entities.characters.enemies.Zombie;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class ZombieBasic extends Zombie 
	{
		
		public function ZombieBasic(posX:Number, posY:Number)
		{
			super(posX, posY);
			
			health = 2;
			damage = 1;
			
			xmlList = xml.zombies.Basic;
			
			rangeX = 160;
			rangeY = 80;
			normalHort = 0.4;
			chaseHort = 0.6;
		}

	}

}