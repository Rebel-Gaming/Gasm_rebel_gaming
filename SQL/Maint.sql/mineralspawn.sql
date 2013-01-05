/* change spawn time for all nodes except copper, tin, and dark iron to 1 hour */
Update gameobject
set `spawntimesecs` = 3600
where`id`IN (324,1610,/*1731,*//*1732,*/1733,1734,1735,2040,2047,2653,/*3763,*//*3764,*/19903,73940,73941,/*103711,*/123309,123310,123848,150079,150080,/*165658,*/175404,177388,180215,181068,181069,/*181248,*//*181249,*/181555,181556,181557,181569,181570,185877,1667,/*2054,*//*2055,*//*103713,*/105569,150081,150082,176643,176645,181108,181109,185557,189978,189979,189980,189981,191133,195036);

/* Change spawn time for copper to 1/2 hour. */

Update gameobject
set `spawntimesecs` = 1800
where`id`IN
(1731,3763,181248,2055,103713);

/* spawn time for tin to 45 mins */
Update gameobject
set `spawntimesecs` = 2700
where`id`IN
(1732,3764,103711,181249,2054);
