package com.backdrops 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author Loose
	 */
	public class Wall extends Entity 
	{
		public var tilemap:Tilemap;
		public var grid:Grid;
		public var tiles:Class;
		public var ogmoLevel:Class;
		
		public function Wall(collection:String) 
		{
			switch(collection)
			{
				case "city":
					tiles = Registry.WALL_BUILD;
					ogmoLevel = Registry.LEVEL_NEW;
				break;
			}
			
			tilemap = new Tilemap(tiles, Registry.levelWidth, Registry.levelHeight, 20, 20);
			grid = new Grid(Registry.levelWidth, Registry.levelHeight, 20, 20);

			layer = Registry.LAYER_WALL;
			
			loadLevel();
			graphic = tilemap;
		}
		
		public function loadLevel():void
		{
			var xml:XML = FP.getXML(ogmoLevel);
			
			var xmlList:XMLList;
			var xmlElement:XML;
			
			xmlList = xml.walls.tile;
			
			for each(xmlElement in xmlList)
			{
				tilemap.setTile(xmlElement.@x / 20, xmlElement.@y / 20, xmlElement.@tx / 20);
			}
		}
		
	}

}