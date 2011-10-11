package com.entities.characters.parts 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Loose
	 */
	public class Eyes extends Part 
	{
		public var rangeX:Number = 40;
		public var rangeY:Number = -5;
		
		public function Eyes(image:Class) 
		{
			super(image);
		}
		
		override public function update():void 
		{
			super.update();
			offset(4, 4);
			look();
		}
		
		public function look():void
		{
			if (parent)
			{				
				/* Horizontal */
				if (FP.world.mouseX <= (parent.character.x - rangeX))
				{
					x -= 3;
				}
				else if ((FP.world.mouseX > (parent.character.x - rangeX)) && (FP.world.mouseX < parent.character.x))
				{
					x -= 2;
				}
				else if ((FP.world.mouseX >= parent.character.x) && (FP.world.mouseX < (parent.character.x + rangeX)))
				{
					x -= 0;
				}
				else if (FP.world.mouseX >= (parent.character.x + rangeX))
				{
					x += 1;
				}
				
				/* Vertical */
				if (FP.world.mouseY < (parent.character.y + rangeY))
				{
					y = 3;
				}
				else
				{
					y = 4;
				}
			}
			
		}
	}

}