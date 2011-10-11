package 
{
	import com.menus.Menu;
	import com.menus.Title;
	import flash.ui.Mouse;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Loose
	 */
	[SWF(width = "640", height = "480")]
	 
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(Registry.WIDTH, Registry.HEIGHT);
			
			Mouse.hide();
			
			FP.screen.scale = 2;
			FP.screen.color = Registry.COLOR;
			//FP.world = new Title();
			FP.world = new Menu();
			
			if (Registry.CONSOLE == 1)
			{
				FP.console.enable();
			}
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}
	
}