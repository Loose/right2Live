package com.entities.characters.parts 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Legs extends Part 
	{
		
		public function Legs(image:Class) 
		{
			super(image, 16);
			setAnimations();
		}
		override public function update():void 
		{
			super.update();
			offset( -3, 11);
		}
	}

}