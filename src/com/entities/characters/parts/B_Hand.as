package com.entities.characters.parts 
{
	/**
	 * ...
	 * @author Loose
	 */
	public class B_Hand extends Part 
	{
		
		public function B_Hand(image:Class) 
		{
			super(image, 16);
			setAnimations();
		}
		
		override public function update():void 
		{
			super.update();
			offset( -3, 7);
		}
		
	}

}