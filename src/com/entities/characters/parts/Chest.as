package com.entities.characters.parts 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Chest extends Part 
	{
		
		public function Chest(image:Class) 
		{
			super(image);
		}
		
		override public function update():void 
		{
			super.update();
			adjust(0, 7);
		}
	}

}