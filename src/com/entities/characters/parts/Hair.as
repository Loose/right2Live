package com.entities.characters.parts 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class Hair extends Part 
	{
		
		public function Hair(image:Class) 
		{
			super(image);
		}
		override public function update():void 
		{
			super.update();
			offset( -3, -5);
		}
	}

}