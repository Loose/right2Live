package com.entities.characters.parts 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Head extends Part 
	{
		
		public function Head(image:Class) 
		{
			super(image);
		}
		override public function update():void 
		{
			super.update();
			adjust(-1);
		}
	}

}