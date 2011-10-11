package com 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author Loose
	 */
	
	public class Level extends Entity 
	{
		public var tilemap:Tilemap;
		public var grid:Grid;
		public var tiles:Class;
		public var ogmoLevel:Class;
		
		public var mapWidth:Number;
		public var mapHeight:Number;
		public var size:Number = 10;
		
		public function Level(level:Number):void
		{
			switch(level)
			{
				case 0:
					tiles = Registry.TILE_BUILDING;
					//ogmoLevel = Registry.LEVEL_SQUARES;
					//ogmoLevel = Registry.LEVEL_WALL;
					ogmoLevel = Registry.LEVEL_NEW;
				break;
			}
			
			setLevel(ogmoLevel);
			
			tilemap = new Tilemap(tiles, mapWidth, mapHeight, Registry.TILE_SIZE, Registry.TILE_SIZE);
			grid = new Grid(mapWidth, mapHeight, Registry.TILE_SIZE * 2, Registry.TILE_SIZE * 2);
			
			tilemap.usePositions = grid.usePositions = true;
			
			mask = grid;
			layer = Registry.LAYER_PLATFORM;
			type = Registry.TYPE_SOLID;
			
			loadLevel(ogmoLevel);
			buildTile();
			
			graphic = tilemap;
		}
		
		public function setLevel(file:Class):void
		{
			var xml:XML = FP.getXML(file);     
			
			mapWidth = xml.width;
			mapHeight = xml.height;
		}
		
		public function loadLevel(file:Class):void
		{
			var xml:XML = FP.getXML(file);
			
			for each(var rect:Object in xml.solids.rect)
			{
				grid.setRect(rect.@x, rect.@y, rect.@w, rect.@h, true);
			}
		}
		
		public function buildTile():void
		{
			var solid:Array = [];
			var a:Number;
			var i:Number;
			
			for (var x:Number = 0; x < mapWidth; x += Registry.TILE_SIZE)
			{				
				for (var y:Number = 0; y < mapHeight; y += Registry.TILE_SIZE)
				{					
					if (grid.getTile(x, y))
					{
						solid[0] = setTile(x + size, y + 0);
						solid[1] = setTile(x + size, y - size);
						solid[2] = setTile(x + 0, y - size);
						solid[3] = setTile(x - size, y - size);
						solid[4] = setTile(x - size, y + 0);
						solid[5] = setTile(x - size, y + size);
						solid[6] = setTile(x + 0, y + size);
						solid[7] = setTile(x + size, y + size);
						
						a = solid[0] +solid[2] + solid[4] + solid[6];
						
						if (a > 0)
						{
							if (a == 1)
							{
								if (solid[0]) i = 1;
								else if (solid[2]) i = 3;
								else if (solid[4]) i = 5;
								else if (solid[6]) i = 7;
								else i = 0;
							}
							else
							{
								if ((solid[0] + solid[2]) == 2) i = 2;
								else if ((solid[2] + solid[4]) == 2) i = 4;
								else if ((solid[4] + solid[6]) == 2) i = 6;
								else if ((solid[6] + solid[0]) == 2) i = 8;
								else i = 0;
							}
						}
						else
						{
							if (solid[1]) i = 9;
							else if (solid[3]) i = 10;
							else if (solid[5]) i = 11;
							else if (solid[7]) i = 12;
							else i = 0;
						}
						
						tilemap.setTile(x, y, i);
					}
				}
			}
		}
		
		private function setTile(x:Number, y:Number):Number
		{
			return grid.getTile(x, y) ? 0 : 1;
		}
	}

}