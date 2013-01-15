/* move objects but not guid's between server db's 
the guid field auto pops
*/
INSERT INTO `devtemple-world`.gameobject (
	id,
	map,
	spawnMask,
	phaseMask,
	position_x,
	position_y,
	position_z,
	orientation,
	rotation0,
	rotation1,
	rotation2,
	rotation3,
	spawntimesecs,
	animprogress,
	state
) SELECT
	gameobject.id,
	gameobject.map,
	gameobject.spawnMask,
	gameobject.phaseMask,
	gameobject.position_x,
	gameobject.position_y,
	gameobject.position_z,
	gameobject.orientation,
	gameobject.rotation0,
	gameobject.rotation1,
	gameobject.rotation2,
	gameobject.rotation3,
	gameobject.spawntimesecs,
	gameobject.animprogress,
	gameobject.state
FROM
	`frostmourne-world`.gameobject
WHERE
	`frostmourne-world`.gameobject.position_x BETWEEN - 5138.48
AND - 4742.70
AND `frostmourne-world`.gameobject.position_y BETWEEN 1292.45
AND 1542.72
AND `frostmourne-world`.gameobject.map = '0'
AND `frostmourne-world`.gameobject.id = 180322
