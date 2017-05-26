#include <h3mlib.h>
#include <internal/h3mlib_ctx.h>

int h3m_object_set_does_not_grow (h3mlib_ctx_t ctx, int od_index, int does_not_grow);
int h3m_object_set_never_flees   (h3mlib_ctx_t ctx, int od_index, int never_flees);

const char *HOMM3LUA_monsters[] = {
  "Air Elemental",
  "Ancient Behemoth",
  "Angel",
  "Arch Devil",
  "Arch Mage",
  "Archangel",
  "Archer",
  "Azure Dragon",
  "Basilisk",
  "Battle Dwarf",
  "Behemoth",
  "Beholder",
  "Black Dragon",
  "Black Knight",
  "Boar",
  "Bone Dragon",
  "Cavalier",
  "Centaur",
  "Centaur Captain",
  "Cerberus",
  "Champion",
  "Chaos Hydra",
  "Crusader",
  "Crystal Dragon",
  "Cyclops",
  "Cyclops King",
  "Demon",
  "Dendroid Guard",
  "Dendroid Soldier",
  "Devil",
  "Diamond Golem",
  "Dragon Fly",
  "Dread Knight",
  "Dwarf",
  "Earth Elemental",
  "Efreet Sultan",
  "Efreeti",
  "Enchanter",
  "Energy Elemental",
  "Evil Eye",
  "Faerie Dragon",
  "Familiar",
  "Fire Elemental",
  "Firebird",
  "Genie",
  "Ghost Dragon",
  "Giant",
  "Gnoll",
  "Gnoll Marauder",
  "Goblin",
  "Gog",
  "Gold Dragon",
  "Gold Golem",
  "Gorgon",
  "Grand Elf",
  "Greater Basilisk",
  "Green Dragon",
  "Gremlin",
  "Griffin",
  "Halberdier",
  "Halfling",
  "Harpy",
  "Harpy Hag",
  "Hell Hound",
  "Hobgoblin",
  "Horned Demon",
  "Hydra",
  "Ice Elemental",
  "Imp",
  "Infernal Troglodyte",
  "Iron Golem",
  "Lich",
  "Lizard Warrior",
  "Lizardman",
  "Mage",
  "Magic Elemental",
  "Magma Elemental",
  "Magog",
  "Manticore",
  "Marksman",
  "Master Genie",
  "Master Gremlin",
  "Medusa",
  "Medusa Queen",
  "Mighty Gorgon",
  "Minotaur",
  "Minotaur King",
  "Monk",
  "Mummy",
  "Naga",
  "Naga Queen",
  "Nomad",
  "Obsidian Gargoyle",
  "Ogre",
  "Ogre Mage",
  "Orc",
  "Orc Chieftain",
  "Peasant",
  "Pegasus",
  "Phoenix",
  "Pikeman",
  "Pit Fiend",
  "Pit Lord",
  "Pixie",
  "Power Lich",
  "Psychic Elemental",
  "Red Dragon",
  "Roc",
  "Rogue",
  "Royal Griffin",
  "Rust Dragon",
  "Scorpicore",
  "Serpent Fly",
  "Sharpshooter",
  "Silver Pegasus",
  "Skeleton",
  "Skeleton Warrior",
  "Sprite",
  "Stone Gargoyle",
  "Stone Golem",
  "Storm Elemental",
  "Swordsman",
  "Thunderbird",
  "Titan",
  "Troglodyte",
  "Troll",
  "Unicorn",
  "Vampire",
  "Vampire Lord",
  "Walking Dead",
  "War Unicorn",
  "Water Elemental",
  "Wight",
  "Wolf Raider",
  "Wolf Rider",
  "Wood Elf",
  "Wraith",
  "Wyvern",
  "Wyvern Monarch",
  "Zealot",
  "Zombie",
  NULL
};