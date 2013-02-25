-- Loot Fix


UPDATE `gameobject_loot_template` SET `entry`='176089' WHERE (`entry`='13574') AND (`item`='12812');

-- Thunderaan spawn loot
UPDATE `smart_scripts` SET `action_param2`='3' WHERE (`entryorguid`='14347') AND (`source_type`='0') AND (`id`='0') AND (`link`='1')
