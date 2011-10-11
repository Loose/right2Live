package com.backdrops 
{
	import net.flashpunk.graphics.Backdrop;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class BackdropHelper extends Backdrop 
	{
		public var moveX:Number = 0;
		public var moveY:Number = 0;
		
		public function BackdropHelper(image:Class, posX:Number = 0, posY:Number = 0, scrollHort:Number = 0, scrollVert:Number = 0, speedX:Number = 0, speedY:Number = 0) 
		{
			super(image, Boolean(scrollHort), false);
			
			x = posX;
			y = posY;
			
			scrollX = scrollHort;
			scrollY = scrollVert;
			
			moveX = speedX;
			moveY = speedY;
		}
		
		override public function update():void 
		{
			super.update();
			
			movement();
		}
		
		public function movement():void
		{
			x += moveX;
			y += moveY;
		}
	}

}