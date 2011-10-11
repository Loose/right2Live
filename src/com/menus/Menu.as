package com.menus 
{
	import com.entities.Cursor;
	import com.Game;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Menu extends World 
	{
		public var ready:Boolean = false;
		
		public var title:Text = new Text(Registry.TITLE);
		public var start:Text = new Text("- Press G to play -");
		public var help:Text = new Text("- Press H for help -");
		
		public var topBlack:Image = Image.createRect(FP.width, FP.height, 0x000000);
		public var bottomBlack:Image = Image.createRect(FP.width, FP.height, 0x000000);
		
		public var flickerTimer:Alarm = new Alarm(0.5, flicker, ONESHOT);
		public var startTween:Boolean = false;
		
		public function Menu() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			Registry.cursor = new Cursor();
			add(Registry.cursor);
			
			FP.screen.color = Registry.COLOR;
			
			start.visible = false;
			help.visible = false;
			title.visible = false;
			
			setBars();
			setText();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Registry.barsClosed)
			{
				openBars();
			}
			else
			{
				topBlack.y = -(FP.halfHeight) * 0.55;
				bottomBlack.y = FP.halfHeight * 0.55;
			}
			
			if (ready || !Registry.barsClosed)
			{
				help.visible = true;
				title.visible = true;
				
				if (Input.pressed(Key.H))
				{
					gotoHelp();
				}
				
				if (Input.pressed(Key.G))
				{
					gotoGame();
				}
				
				/** Special **/
				else if (Input.pressed(Key.BACKSPACE))
				{
					Registry.love = 42;
					gotoGame();
				}
				
				if (!startTween)
				{
					start.visible = true;
					addTween(flickerTimer, true);
					startTween = true;
				}
			}
		}
		
		public function flicker():void
		{
			removeTween(flickerTimer);
			
			if (start.visible)
			{
				start.visible = false;
			}
			else if(!start.visible)
			{
				start.visible = true;
			}
			
			addTween(flickerTimer, true);
		}
		
		public function setText():void
		{
			start.size = Text.size * 0.5;
			start.centerOO();
			addGraphic(start, Registry.LAYER_TEXT, FP.halfWidth, FP.halfHeight * 1.72);
			
			help.size = Text.size * 0.5;
			help.centerOO();
			addGraphic(help, Registry.LAYER_TEXT, FP.halfWidth, FP.halfHeight * 1.82);
			
			title.centerOO();
			addGraphic(title, Registry.LAYER_TEXT, FP.halfWidth, FP.halfHeight * 0.22);
		}
		
		public function setBars():void
		{
			addGraphic(topBlack, 1000, 0, -(FP.halfHeight));
			addGraphic(bottomBlack, 1000, 0, FP.halfHeight);
		}
		
		public function openBars():void
		{
			var speed:Number = 80;
			var open:Number = 0.55;
			
			if (topBlack.y > -(FP.halfHeight) * open)
			{
				topBlack.y -= FP.elapsed * speed;
			}
			if (bottomBlack.y < FP.halfHeight * open)
			{
				bottomBlack.y += FP.elapsed * speed;
			}
			else
			{
				ready = true;
				Registry.barsClosed = false;
			}
		}
		
		public function gotoHelp():void
		{
			FP.world = new Help();
		}
		
		public function gotoGame():void
		{
			FP.world = new Game();
		}
		
	}

}