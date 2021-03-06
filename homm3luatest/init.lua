-- Either set it here or in LUA_CPATH
package.cpath = package.cpath .. ';dist/?.so;../dist/?.so'

-- Yay!
local homm3lua = require('homm3lua')
local instance = homm3lua.new(homm3lua.FORMAT_ROE, homm3lua.SIZE_EXTRALARGE)

-- General informations
instance:name('Test of homm3lua')
instance:description('Example of everything we can do with homm3lua (at the moment).')
instance:difficulty(homm3lua.DIFFICULTY_IMPOSSIBLE)
instance:underground(true)

instance:player(homm3lua.PLAYER_1)
instance:player(homm3lua.PLAYER_2)
instance:player(homm3lua.PLAYER_3)
instance:player(homm3lua.PLAYER_4)
instance:player(homm3lua.PLAYER_5)
instance:player(homm3lua.PLAYER_6)
instance:player(homm3lua.PLAYER_7)
instance:player(homm3lua.PLAYER_8)

-- Terrain
instance:terrain(homm3lua.TERRAIN_GRASS)
instance:terrain(function (x, y, z)
    -- All underground is currently "walled"
    if z == 1 then
        return homm3lua.TERRAIN_ROCK
    end

    -- Roads (same order like in the editor)
    if x == 32 and y >= 10 and y <= 16 then return nil, 1 end
    if x == 34 and y >= 10 and y <= 16 then return nil, 2 end
    if x == 36 and y >= 10 and y <= 16 then return nil, 3 end

    -- Rivers (same order like in the editor)
    if x == 38 and y >= 10 and y <= 16 then return nil, nil, 1 end
    if x == 40 and y >= 10 and y <= 16 then return nil, nil, 2 end
    if x == 42 and y >= 10 and y <= 16 then return nil, nil, 3 end
    if x == 44 and y >= 10 and y <= 16 then return nil, nil, 4 end

    -- Playground
    if x < 40 and y < 20 then
        return nil
    end

    -- Graph plotting
    local f = require('math').sin
    local range = 8 * math.pi
    local scale = homm3lua.SIZE_EXTRALARGE

    local nx = x / scale * range
    local ny = (math.floor(scale / 2) - y) / math.floor(scale / 2)
    local ok = 1 / scale

    return math.min(math.floor((math.abs(ny - f(nx)) - ok) * 2), 2) + 7
end)

-- Creatures
instance:creature(homm3lua.CREATURE_ARCHANGEL, {x=3, y=15, z=0}, 45, homm3lua.DISPOSITION_AGGRESSIVE, true,  true)
instance:creature(homm3lua.CREATURE_ARCHANGEL, {x=3, y=16, z=0}, 45, homm3lua.DISPOSITION_COMPLIANT,  true,  false)
instance:creature(homm3lua.CREATURE_ARCHANGEL, {x=3, y=17, z=0}, 45, homm3lua.DISPOSITION_FRIENDLY,   false, true)
instance:creature(homm3lua.CREATURE_ARCHANGEL, {x=3, y=18, z=0}, 45, homm3lua.DISPOSITION_HOSTILE,    false, false)
instance:creature(homm3lua.CREATURE_ARCHANGEL, {x=3, y=19, z=0},  0, homm3lua.DISPOSITION_SAVAGE,     true,  false) -- Random quantity

-- Mines
instance:mine(homm3lua.MINE_ALCHEMISTS_LAB, {x=10, y=17, z=0}, homm3lua.OWNER_NEUTRAL)
instance:mine(homm3lua.MINE_CRYSTAL_CAVERN, {x=19, y=17, z=0}, homm3lua.OWNER_NEUTRAL)
instance:mine(homm3lua.MINE_GEM_POND,       {x=22, y=17, z=0}, homm3lua.OWNER_NEUTRAL)
instance:mine(homm3lua.MINE_GOLD_MINE,      {x=25, y=17, z=0}, homm3lua.OWNER_NEUTRAL)
instance:mine(homm3lua.MINE_ORE_PIT,        {x=13, y=17, z=0}, homm3lua.OWNER_NEUTRAL)
instance:mine(homm3lua.MINE_SAWMILL,        {x=7,  y=17, z=0}, homm3lua.OWNER_NEUTRAL)
instance:mine(homm3lua.MINE_SULFUR_DUNE,    {x=16, y=17, z=0}, homm3lua.OWNER_NEUTRAL)

-- Resources
instance:resource(homm3lua.RESOURCE_CRYSTAL, {x=1, y=16, z=0}, 40)
instance:resource(homm3lua.RESOURCE_GEMS,    {x=1, y=17, z=0}, 50)
instance:resource(homm3lua.RESOURCE_GOLD,    {x=1, y=18, z=0}, 60)
instance:resource(homm3lua.RESOURCE_MERCURY, {x=1, y=13, z=0}, 10)
instance:resource(homm3lua.RESOURCE_ORE,     {x=1, y=14, z=0}, 20)
instance:resource(homm3lua.RESOURCE_SULFUR,  {x=1, y=15, z=0}, 30)
instance:resource(homm3lua.RESOURCE_WOOD,    {x=1, y=12, z=0}, 0) -- Random quantity

-- Artifacts
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_COURAGE,      {x=25, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_DEATH,        {x=21, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_DISPASSION,   {x=17, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_FREE_WILL,    {x=22, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_HOLINESS,     {x=19, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_LIFE,         {x=20, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_NEGATIVITY,   {x=23, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_SECOND_SIGHT, {x=18, y=15, z=0})
instance:artifact(homm3lua.ARTIFACT_PENDANT_OF_TOTAL_RECALL, {x=24, y=15, z=0})

-- Obstacles
instance:obstacle('Rock',       {x=26, y=15, z=0})
instance:obstacle('Mushrooms',  {x=27, y=15, z=0})
instance:obstacle('Pine Trees', {x=28, y=15, z=0})

-- Heroes
instance:hero(homm3lua.HERO_CHRISTIAN, {x=3,  y=4, z=0}, homm3lua.PLAYER_1)
instance:hero(homm3lua.HERO_JENOVA,    {x=8,  y=4, z=0}, homm3lua.PLAYER_2)
instance:hero(homm3lua.HERO_FAFNER,    {x=13, y=4, z=0}, homm3lua.PLAYER_3)
instance:hero(homm3lua.HERO_CALH,      {x=18, y=4, z=0}, homm3lua.PLAYER_4)
instance:hero(homm3lua.HERO_CHARNA,    {x=23, y=4, z=0}, homm3lua.PLAYER_5)
instance:hero(homm3lua.HERO_AJIT,      {x=28, y=4, z=0}, homm3lua.PLAYER_6)
instance:hero(homm3lua.HERO_CRAG_HACK, {x=33, y=4, z=0}, homm3lua.PLAYER_7)
instance:hero(homm3lua.HERO_ALKIN,     {x=38, y=4, z=0}, homm3lua.PLAYER_8)

-- Towns
instance:town(homm3lua.TOWN_CASTLE,     {x=4,  y=3, z=0}, homm3lua.PLAYER_1, true)
instance:town(homm3lua.TOWN_RAMPART,    {x=9,  y=3, z=0}, homm3lua.PLAYER_2, true)
instance:town(homm3lua.TOWN_TOWER,      {x=14, y=3, z=0}, homm3lua.PLAYER_3, true)
instance:town(homm3lua.TOWN_INFERNO,    {x=19, y=3, z=0}, homm3lua.PLAYER_4, true)
instance:town(homm3lua.TOWN_NECROPOLIS, {x=24, y=3, z=0}, homm3lua.PLAYER_5, true)
instance:town(homm3lua.TOWN_DUNGEON,    {x=29, y=3, z=0}, homm3lua.PLAYER_6, true)
instance:town(homm3lua.TOWN_STRONGHOLD, {x=34, y=3, z=0}, homm3lua.PLAYER_7, true)
instance:town(homm3lua.TOWN_FORTRESS,   {x=39, y=3, z=0}, homm3lua.PLAYER_8, true)
instance:town(homm3lua.TOWN_RANDOM,     {x=44, y=3, z=0}, homm3lua.OWNER_NEUTRAL)

-- Sign
instance:sign('Example...', {x=4, y=4, z=0})
instance:sign('...text...', {x=5, y=4, z=0})
instance:sign('...here!!!', {x=6, y=4, z=0})

-- Fun!
instance:text('HELLO', {x=4, y=5,  z=0}, 'Pandora\'s Box')
instance:text('WORLD', {x=3, y=10, z=0}, homm3lua.CREATURE_MASTER_GREMLIN)

-- Save
instance:write('test.h3m')
