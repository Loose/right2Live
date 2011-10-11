package com.menus 
{
	import com.entities.Cursor;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Help extends World 
	{
		public var help:Text = new Text("Help");
		public var goBack:Text = new Text("Press H to return");
		
		public var move:Text = new Text("Movement");
		public var action:Text = new Text("Action");
		public var aim:Text = new Text("Aim/Shoot");
		public var pause:Text = new Text("Pause");
		
		public var wasd:Image = new Image(Registry.KEY_WASD);
		public var e:Image = new Image(Registry.KEY_E);
		public var mouse:Image = new Image(Registry.KEY_MOUSE);
		public var p:Image = new Image(Registry.KEY_P);
		
		public var bottomBlack:Image = Image.createRect(FP.width, FP.height, 0x000000);
		public var topBlack:Image = Image.createRect(FP.width, FP.height, 0x000000);
		
		public function Help() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			FP.screen.color = Registry.COLOR;
			
			Registry.cursor = new Cursor();
			add(Registry.cursor);
			
			addGraphic(topBlack, 1000, 0, -(FP.halfHeight) * 1.55);
			addGraphic(bottomBlack, 1000, 0, FP.halfHeight * 1.55);
			
			setText();
			setImage();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.H))
			{
				FP.world = new Menu();
			}
		}
		
		public function setText():void
		{
			var height:Number = 1.9;
			
			help.centerOO();
			addGraphic(help, Registry.LAYER_TEXT, FP.halfWidth, FP.halfHeight * 0.22);
			
			goBack.size = Text.size * 0.5;
			goBack.centerOO();
			addGraphic(goBack, Registry.LAYER_TEXT, FP.halfWidth * 1.7, FP.halfHeight * 0.1);
			
			move.size = Text.size * 0.5;
			move.centerOO();
			addGraphic(move, Registry.LAYER_TEXT, FP.halfWidth * 0.4, FP.halfHeight * height);
			
			action.size = Text.size * 0.5;
			action.centerOO();
			addGraphic(action, Registry.LAYER_TEXT, FP.halfWidth * 0.8, FP.halfHeight * height);
			
			aim.size = Text.size * 0.5;
			aim.centerOO();
			addGraphic(aim, Registry.LAYER_TEXT, FP.halfWidth * 1.2, FP.halfHeight * height);
			
			pause.size = Text.size * 0.5;
			pause.centerOO();
			addGraphic(pause, Registry.LAYER_TEXT, FP.halfWidth * 1.6, FP.halfHeight * height);
		}
		
		public function setImage():void
		{
			var height:Number = 1.7;
			
			wasd.centerOO();
			addGraphic(wasd, Registry.LAYER_TEXT, FP.halfWidth * 0.4, FP.halfHeight * height);
			
			e.centerOO();
			addGraphic(e, Registry.LAYER_TEXT, FP.halfWidth * 0.8, FP.halfHeight * height);
			
			mouse.centerOO();
			addGraphic(mouse, Registry.LAYER_TEXT, FP.halfWidth * 1.2, FP.halfHeight * height);
			
			p.centerOO();
			addGraphic(p, Registry.LAYER_TEXT, FP.halfWidth * 1.6, FP.halfHeight * height);
		}
		
	}

}