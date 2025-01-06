# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

u1 = User.find_or_create_by(email_address: "bdh@machinehum.com")

{ human: [8,8,8,8,7,6,9, 
            "The adaptable and resourceful people of the mortal world. Humans thrive in diverse environments, excelling in ingenuity, leadership, and sheer willpower."], 
  fae: [7,6,9,9,10,9,6,
            "Mystical beings with an enchanting presence and a natural affinity for magic. Their grace and charm are unmatched, but their motives are often inscrutable."], 
  gnome: [7,6,10,9,6,8,7,
            "Crafty folk of the earth, the gnomes are skilled artisans, builders, and illusionists. They are a friend to fae and creatures of the earth... as for others... "], 
  goliath: [11,11,5,5,6,7,8,
            "Descendants of mighty warrior spirits of the land, Goliaths are strong and imposing figures. Their strength is legendary, and their wisdom runs deep."], 
  selkie: [7,8,7,8,7,10,9,
            "Kin of the sea, Selkies are dual-natured beings who can shift between human form and their aquatic heritage. They are enigmatic and captivating, deeply tied to water and the mysteries it holds."], 
  shadow: [6,7,7,10,6,9,8,
            "Elusive beings who dwell in the mists and night, Shadows are agile and perceptive. They often serve as scouts, spies, or guides through the unknown."] 
}.each do |k,v|
  x = Kinship.find_or_create_by(label: k)
  x.update(description: v[7], vitality: v[0], strength: v[1], agility: v[2], intelligence: v[3],
            connectedness: v[4], arcadia: v[5], luck: v[6])
end

['ok','dead','lost','paralyzed','ashes','asleep','silenced','afraid','poisoned'].each do |s|
  CharacterStatus.find_or_create_by(label: s)
end

ct1 = CreatureType.find_or_create_by(label: "Miniature Dragon")
ct1.update(
  description: "A tiny dragon! It's cute, but even a match can burn.",
  health: 10,
  strength: 3,
  agility: 10,
  intelligence: 5,
  connectedness: 2,
  arcadia: 6,
  luck: 10
  )

Room.find_or_create_by(label: "Room 1", description: "a dark, damp room with moldy tapestries on the walls")
Room.find_or_create_by(label: "Room 2", description: "a brightly-lit ballroom... the light is confusing until you realize most of the wall and ceiling in one corner has collapsed")
Room.find_or_create_by(label: "Room 3", description: "a weird cupboard with potions long expired")
Room.find_or_create_by(label: "Room 4", description: "a vestibule full of sleepy bees")

r1 = Room.find_or_create_by(label: "Companion Shelter", description: "a building where you can find a companion to adopt")
r1.update(standalone: true)

n1 = Node.find_or_create_by(label:"test node 1", locatable: Room.find_by(label: "Room 1"))
n2 = Node.find_or_create_by(label:"test node 2", locatable: Room.find_by(label: "Room 2"))
n3 = Node.find_or_create_by(label:"test node 3", locatable: Room.find_by(label: "Room 3"))
n4 = Node.find_or_create_by(label:"test node 4", locatable: Room.find_by(label: "Room 4"))

n1.pictures.find_or_create_by(filename: "IMG_0595.png")
n2.pictures.find_or_create_by(filename: "IMG_0596.png")

e1 = Edge.find_or_create_by(description: "a red 1 2 hallway", weight: 5)
e2 = Edge.find_or_create_by(description: "a green 1 3 hallway", weight: 8)
e3 = Edge.find_or_create_by(description: "a blue 2 3 hallway", weight: 4)
e4 = Edge.find_or_create_by(description: "a yellow 2 4 hallway", weight: 2)

Portal.find_or_create_by(edge: e1, node: n1, description: "a red-looking hallway with light at the end")
Portal.find_or_create_by(edge: e1, node: n2, description: "a red-looking hallway leading into the dark")

Portal.find_or_create_by(edge: e2, node: n1, description: "a small door")
Portal.find_or_create_by(edge: e2, node: n3, description: "a small open door")

Portal.find_or_create_by(edge: e3, node: n2, description: "node 2 to edge 3 door" )
Portal.find_or_create_by(edge: e3, node: n3, description: "node 3 to edge 3 door")

Portal.find_or_create_by(edge: e4, node: n2, description: "node 2 to edge 4 door")
Portal.find_or_create_by(edge: e4, node: n4, description: "node 4 to edge 4 door")

n5 = Node.find_or_create_by(label:"node 5", locatable: Room.find_by(label: "Companion Shelter"))
n5.pictures.find_or_create_by(filename: "companion_shelter_exterior.jpg")
e5 = Edge.find_or_create_by(description: "companion shelter / ballroom edge", weight: 15)
Portal.find_or_create_by(edge: e5, node: n2, description: "Gap in the ballroom wall leading outside" )
Portal.find_or_create_by(edge: e5, node: n5, description: "Path to a gap in the wall of a large, grand room")

comp1 = Companion.find_or_create_by(creature_type_id: ct1.id, name: "Trogderp", node: n2)
comp1.pictures.find_or_create_by(filename: "tiny_dragon.jpg")
comp1.icons.find_or_create_by(filename: "tiny_dragon_icon.png")

CharacterClass.find_or_create_by(label: "Druid", description: "naturey junk",hit_coefficient_divisor: 3, hit_coefficient_bonus: 2)
CharacterClass.find_or_create_by(label: "Shadewalker", description: "shadow junk", hit_coefficient_divisor: 3, hit_coefficient_bonus: 2)
CharacterClass.find_or_create_by(label: "Witch", description: "spell junk", hit_coefficient_divisor: 5, hit_coefficient_bonus: 0)
CharacterClass.find_or_create_by(label: "Hunter", description: "fighty animal junk", hit_coefficient_divisor: 3, hit_coefficient_bonus: 2)
CharacterClass.find_or_create_by(label: "Bard", description: "social junk", hit_coefficient_divisor: 4, hit_coefficient_bonus: 1)
CharacterClass.find_or_create_by(label: "Feybinder", description: "fey junk", hit_coefficient_divisor: 5, hit_coefficient_bonus: 0)

p1 = Player.find_or_create_by(name: "Mr. Bones", character_class: CharacterClass.find_or_create_by(label: "Druid"), kinship: Kinship.find_or_create_by(label: 'gnome'), user_id: u1.id)
p1.update(
  max_health: 12,
  health: 9,
  strength: 6,
  agility: 9,
  intelligence: 8,
  connectedness: 12,
  arcadia: 6,
  luck: 10,
  level: 1,
  gold: 500,
  xp: 0
)

g1 = Game.find_or_create_by(player: Player.find_by(name: "Mr. Bones"))

gc1 = GameCompanion.find_or_create_by(player_id: p1.id, game_id: g1.id, companion_id: comp1.id, game_node_id: comp1.node_id)
gc1.update(
  max_health: comp1.health,
  health: comp1.health,
  strength: comp1.strength,
  agility: comp1.agility,
  intelligence: comp1.intelligence,
  connectedness: comp1.connectedness,
  arcadia: comp1.arcadia,
  luck: comp1.luck
  )

Node.all.each do |n|
  GameNode.find_or_create_by(node:n, game: g1)
end

g1.update(game_node: GameNode.find_by(game: g1, node: n1))

npc1 = Npc.find_or_create_by(label: "talkative bear", description: "He is large, furry, and generally bear-like", assertive: true)
npc1.pictures.find_or_create_by(filename: "bear.jpg")

nd1 = NpcDialogue.find_or_create_by(npc: npc1, initial: true, seen: false, dialogue: "Oh hullo! Do you fancy some honey?")
nd2 = NpcDialogue.find_or_create_by(npc: npc1, initial: false, seen: true, dialogue: "It's you again... did you take any honey? I can't recall.")
nd3 = NpcDialogue.find_or_create_by(npc: npc1, initial: false, seen: true, dialogue: "Hope you liked it.")
nd4 = NpcDialogue.find_or_create_by(npc: npc1, initial: false, seen: true, dialogue: "Too bad for you!")
nd5 = NpcDialogue.find_or_create_by(npc: npc1, initial: false, seen: true, dialogue: "All you can eat!")
nd6 = NpcDialogue.find_or_create_by(npc: npc1, initial: false, seen: true, dialogue: "Some people...")

NpcResponse.find_or_create_by(npc_dialogue: nd1, next_dialogue: nd5, response_text: "Yes")
NpcResponse.find_or_create_by(npc_dialogue: nd1, next_dialogue: nd6, response_text: "No")

NpcResponse.find_or_create_by(npc_dialogue: nd2, next_dialogue: nd3, response_text: "Yes")
NpcResponse.find_or_create_by(npc_dialogue: nd2, next_dialogue: nd4, response_text: "No")

npc2 = Npc.find_or_create_by(label: "reticent skeleton", description: "It is unusual to see bones so animated, but you have become resigned to the unusual", assertive: false)
NpcDialogue.find_or_create_by(npc: npc2, initial: true, seen: false, dialogue: "What sort of disturbance is this?")
NpcDialogue.find_or_create_by(npc: npc2, initial: false, seen: true, dialogue: "Why are you bothering me again?")

npc3 = Npc.find_or_create_by(label: "aggressive ooze")
npc3.pictures.find_or_create_by(filename: "aggressive_ooze.jpg")
npc3.update(
  description: "comes at you hissing",
  assertive: true, 
  combatable: true,
  level: 1,
  max_health: 2,
  health: 2,
  strength: 1,
  agility: 4,
  intelligence: 2,
  connectedness: 12,
  arcadia: 6,
  luck: 1,
  strikes: "roll2d2,roll1d6"
)

Npc.all.each do |n|
  gn = GameNpc.find_or_create_by(npc:n, game: g1)
  gn.update(health: (n.max_health || 10))
end

i1 = Item.find_or_create_by(label: "Oooo shiny", description: "shiny and round, of unknown origin and use", inspection: "You can see your reflection in the shiny round shiny. It still isn't clear what use it may have. It is light in your hands. You have a feeling it may reveal itself when the time is right.", weight: 1, packable: true, working: true, armor_modifier: -3, armor: true)
i2 = Item.find_or_create_by(label: "Stringy bonky thing", description: "string-like thing that is also hard and possibly useful for bonks", inspection: "This may be a collapsible truncheon of some sort. It's woobly but has the character of being able to be wielded for bonking.", weight: 1, packable: true, working: true, armor_modifier: 0, hit_damage: "roll1d6", hit_modifier: 2, swing_count: 3, weapon: true)
i3 = Item.find_or_create_by(label: "Jar of honey", description: "edible, with other possible uses", inspection: "Sticky.", weight: 1, packable: true, working: true, wand: true)

Item.all.each do |n|
  gi = GameItem.find_or_create_by(item:n, game: g1)
  gi.update(equipped: false)
end

ne1 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n1), encounterable: GameItem.find_by(game: g1, item: i1))
ne2 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n1), encounterable: GameItem.find_by(game: g1, item: i2))

ne3 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n1), encounterable: GameNpc.find_by(game: g1, npc: npc1))
ne4 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n2), encounterable: GameNpc.find_by(game: g1, npc: npc2))
ne5 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n2), encounterable: GameNpc.find_by(game: g1, npc: npc3))

sh1 = Shop.find_or_create_by(room_id: r1.id, npc_id: npc2.id)
sh1.pictures.find_or_create_by(filename: "companion_shelter.jpg")
gsh1 = GameShop.find_or_create_by(shop_id: sh1.id, game_id: g1.id, game_npc_id: GameNpc.find_by(game: g1, npc: npc2).id )
gsh1.update(game_node_id: GameNode.find_by(game_id: g1.id, node_id: gsh1.shop.room.node.id).id)
shi1 = ShopInventory.find_or_create_by(game_shop_id: gsh1.id, game_companion_id: gc1.id, price: 500, stock: 1)


