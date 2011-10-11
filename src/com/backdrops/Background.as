package com.backdrops 
{
	import net.flashpunk.graphics.Graphiclist;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Background extends Graphiclist 
	{
		public var hiLite:BackdropHelper;
		public var hiMid:BackdropHelper;
		public var hiDark:BackdropHelper;
		
		public var loLite:BackdropHelper;
		public var loMid:BackdropHelper;
		public var loDark:BackdropHelper;
		
		public function Background(collection:String) 
		{			
			switch(collection)
			{
				case "city":
					setHi("storm");
					setLo("city");
				break;
			}			
			makeBackground();
			active = true;
		}
		override public function update():void 
		{
			super.update();
		}
		
		public function setHi(value:String):void
		{
			switch(value)
			{
				case "storm":
					hiLite = new BackdropHelper(Registry.BD_CLOUD_L, 0, 160, 0.4, 0.4, 0.4, 0);
					hiMid = new BackdropHelper(Registry.BD_CLOUD_M, 0, 80, 0.3, 0.3, 0.3, 0);
					hiDark = new BackdropHelper(Registry.BD_CLOUD_D, 0, 0, 0.2, 0.2, 0.2, 0);
				break;
			}
		}
		
		public function setLo(value:String):void
		{
			switch(value)
			{
				case "city":
					loLite = new BackdropHelper(Registry.BD_BUILD_L, 0, Registry.levelHeight - 1000, 0.7, 0.7, 0, 0);
					loMid = new BackdropHelper(Registry.BD_BUILD_M, 0, Registry.levelHeight - 900, 0.6, 0.8, 0, 0);
					loDark = new BackdropHelper(Registry.BD_BUILD_D, 0, Registry.levelHeight - 850, 0.5, 0.9, 0, 0);
				break;
			}
		}
		
		public function makeBackground():void
		{
			add(hiLite);
			add(hiMid);
			add(hiDark);
			
			add(loLite);
			add(loMid);
			add(loDark);
			
			activate();
		}
		
		public function activate():void
		{
			for each(var g:BackdropHelper in children)
			{
				g as BackdropHelper;
				g.active = true;
			}
		}
	}

}