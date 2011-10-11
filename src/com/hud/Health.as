package com.hud 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Health extends Entity 
	{
		public var hitpoint:Tilemap = new Tilemap(Registry.HEALTH_POINT, 48, 8, 12, 8);
		public var container:Image = new Image(Registry.HEALTH_CONTAIN);
		
		public var list:Graphiclist = new Graphiclist();
		
		public function Health() 
		{
			x = 16;
			y = 12;
			layer = Registry.LAYER_HUD;
			
			hitpoint.x += 2;
			hitpoint.y += 1;
			hitpoint.scrollX = hitpoint.scrollY = 0;
			container.scrollX = container.scrollY = 0;
			
			list.add(hitpoint);
			list.add(container);
			graphic = list;
			
			setHitbox(48, 12);
			
			updateGraphic();
		}
		
		override public function update():void 
		{
			super.update();
			
			collisions();
		}
		
		public function modifyHealth(value:Number):void
		{
			if (Registry.player.health > 0 && Registry.player.health <= 4)
			{
				Registry.player.health += value;
			}
			
			updateGraphic();
		}
		
		public function updateGraphic():void
		{
			hitpoint.clearRect(0, 0, 4, 1);
			hitpoint.setRect(0, 0, Registry.player.health, 1, 0);
			
			if (Registry.player.health <= 4)
			{
				hitpoint.setRect(Registry.player.health, 0, 4 - Registry.player.health, 1, 1);
			}
		}
		
		public function collisions():void
		{
			var c:Entity = collide(Registry.TYPE_CURSOR, x, y);
			
			if (c)
			{
				hitpoint.alpha = 0.4;
				container.alpha = 0.4;
			}
			else
			{
				hitpoint.alpha = 1;
				container.alpha = 1;
			}
		}
	}

}