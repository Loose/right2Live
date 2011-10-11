package com.entities.characters.parts 
{
	import com.entities.characters.Sprite;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Part extends Spritemap
	{
		public var parent:Sprite;
		
		public function Part(image:Class, frameWidth:Number = 0, frameHeight:Number = 0)
		{
			super(image, frameWidth, frameHeight);
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		public function adjust(horizontal:Number = 0, vertical:Number = 0):void
		{
			if (parent)
			{
				y = parent.y + vertical;
				mirror(horizontal);
			}
		}
		
		public function offset(horizontal:Number = 0, vertical:Number = 0):void
		{
			if (parent)
			{
				x = parent.x + horizontal;
				y = parent.y + vertical;
			}
		}
		
		public function mirror(offset:Number):void
		{
			if (flipped)
			{
				x = parent.x + offset;
			}
			else
			{
				x = parent.x - offset;
			}
		}
		
		public function setAnimations():void
		{
			add("idle", [0], Registry.GLOBAL_FPS);
			add("walk", [0, 1, 0, 2], Registry.GLOBAL_FPS);
			add("jump", [1], Registry.GLOBAL_FPS);
		}
	}
}