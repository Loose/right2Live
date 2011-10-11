package com.entities.characters.parts 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Face extends Part 
	{
		
		public function Face(image:Class) 
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