package com.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Cursor extends Entity 
	{
		public var image:Image;
		
		public function Cursor() 
		{			
			image = new Image(Registry.IMG_CURSOR);
			
			image.alpha = 0.6;
			image.scrollX = image.scrollY = 0;
			graphic = image;
			layer = Registry.LAYER_CURSOR;
			type = Registry.TYPE_CURSOR;
			
			setHitbox(5, 5);
		}
		
		override public function update():void 
		{
			super.update();
			
			movement();
		}
		
		public function movement():void
		{
			//x = FP.camera.x + Input.mouseX;
			//y = FP.camera.y + Input.mouseY;
			
			x = Input.mouseX;
			y = Input.mouseY;
		}
	}

}