{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 169.0, 0.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"defrect" : [ 169.0, 0.0, 640.0, 480.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-20",
					"patching_rect" : [ 190.0, 430.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Game Initialized (Trigger: 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /WarMachine/GameInitialized",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-4",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 191.0, 285.0, 197.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-17",
					"patching_rect" : [ 160.0, 431.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Oldest Missile's Y Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-16",
					"patching_rect" : [ 130.0, 430.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Oldest Missile's X Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-15",
					"patching_rect" : [ 101.0, 430.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Exploded Missile's Y Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"hidden" : 1,
					"numoutlets" : 0,
					"id" : "obj-14",
					"patching_rect" : [ 72.0, 430.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "Exploded Missile's X Coordinate (Continuous: 0.0 to 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"numoutlets" : 0,
					"id" : "obj-13",
					"patching_rect" : [ 45.0, 429.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"comment" : "A Missile Exploded (Trigger: 1.0)"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /WarMachine/OldestMissileY",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-10",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 160.0, 259.0, 189.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /WarMachine/OldestMissileX",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-9",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 130.0, 234.0, 189.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /WarMachine/ExplodedMissileY",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-8",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 101.0, 206.0, 204.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /WarMachine/ExplodedMissileX",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-7",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 72.0, 178.0, 204.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /WarMachine/MissileExploded",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-6",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 46.0, 148.0, 196.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Port Defaults to 8805\nOptional argument can change that",
					"linecount" : 3,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"id" : "obj-2",
					"fontname" : "Arial",
					"patching_rect" : [ 418.0, 42.0, 154.0, 48.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 1",
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"id" : "obj-50",
					"outlettype" : [ "int" ],
					"fontname" : "Arial",
					"patching_rect" : [ 307.0, 62.0, 59.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "patcherargs 8805",
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"id" : "obj-49",
					"outlettype" : [ "", "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 307.0, 39.0, 104.0, 20.0 ],
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "port $1",
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"id" : "obj-48",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 307.0, 85.0, 48.0, 18.0 ],
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 8805",
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"id" : "obj-1",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"patching_rect" : [ 307.0, 110.0, 99.0, 20.0 ],
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
