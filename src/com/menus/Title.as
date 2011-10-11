package com.menus 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.Alarm;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Title extends World 
	{
		public var inTimer:Alarm;
		public var outTimer:Alarm;
		public var menuTimer:Alarm;
		
		public var fadingIn:Boolean = false;
		public var fadingOut:Boolean = false;
		
		public var cover:Image = Image.createRect(FP.width, FP.height, 0xFFFFFF);
		public var bg:Image = Image.createRect(FP.width, FP.height, 0x000000);
		
		public var creator:Text;
		public var logo:Entity = new Entity;
		
		public function Title() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			setLogo();
			
			addGraphic(bg, 1000);
			addGraphic(cover);
			add(logo);
			FP.screen.color = 0x000000;
			
			inTimer = new Alarm(2, startFadeIn, ONESHOT);
			outTimer = new Alarm(3, startFadeOut, ONESHOT);
			menuTimer = new Alarm(2, gotoMenu, ONESHOT);
			addTween(inTimer, true);
		}
		
		override public function update():void 
		{
			super.update();
			
			
			
			if (fadingIn)
			{
				fadeIn(cover);
			}
			
			if (fadingOut)
			{
				fadeOut(cover);
			}
		}
		
		public function gotoMenu():void
		{
			FP.world = new Menu();
		}
		
		public function startFadeIn():void
		{
			fadingIn = true;
		}
		
		public function startFadeOut():void
		{
			fadingOut = true;
		}
		
		public function fadeIn(image:Image = null, duration:Number = 0.5):void
		{
			if (image.alpha > 0)
			{
				image.alpha -= FP.elapsed * duration;
				logo.y -= image.alpha;
			}
			else
			{
				fadingIn = false;
				addTween(outTimer, true);
				setText();
			}
		}
		
		public function fadeOut(image:Image, duration:Number = 0.5):void
		{
			cover.color = 0x000000;
			
			if (image.alpha < 1)
			{
				image.alpha += FP.elapsed * duration;
			}
			else
			{
				fadingOut = false;
				addTween(menuTimer, true);
			}
		}
		
		public function setLogo():void
		{
			logo.graphic = new Image(Registry.LOGO);
			logo.setHitbox(100, 100);
			logo.x = FP.halfWidth - logo.width * 0.5;
			logo.y = FP.halfHeight - logo.height * 0.2;
			logo.layer = 1;
		}
		
		public function setText():void
		{
			creator = new Text(Registry.CREATOR);
			creator.centerOO();
			addGraphic(creator, 1, FP.halfWidth, FP.halfHeight * 1.3);
		}
	}

}