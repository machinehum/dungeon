# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Room.find_or_create_by(label: "Room 1", description: "a dark, damp room with moldy tapestries on the walls")
Room.find_or_create_by(label: "Room 2", description: "a brightly-lit ballroom... the light is confusing until you realize most of the wall and ceiling in one corner has collapsed")
Room.find_or_create_by(label: "Room 3", description: "a weird cupboard with potions long expired")
Room.find_or_create_by(label: "Room 4", description: "a vestibule full of sleepy bees")

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

Portal.delete_all 

Portal.find_or_create_by(edge: e1, node: n1, description: "a red-looking hallway with light at the end")
Portal.find_or_create_by(edge: e1, node: n2, description: "a red-looking hallway leading into the dark")

Portal.find_or_create_by(edge: e2, node: n1, description: "a small door")
Portal.find_or_create_by(edge: e2, node: n3, description: "a small open door")

Portal.find_or_create_by(edge: e3, node: n2, description: "node 2 to edge 3 door")
Portal.find_or_create_by(edge: e3, node: n3, description: "node 3 to edge 3 door")

Portal.find_or_create_by(edge: e4, node: n2, description: "node 2 to edge 4 door")
Portal.find_or_create_by(edge: e4, node: n4, description: "node 4 to edge 4 door")

CharacterClass.find_or_create_by(label: "Druid", description: "naturey junk")

p1 = Player.find_or_create_by(name: "Mr. Bones", character_class: CharacterClass.find_or_create_by(label: "Druid"))
ps = CharacterStat.find_or_create_by(stattable_type: 'Player', stattable_id: p1.id)
ps.update(
  health: 20,
  strength: 6,
  speed: 9,
  bravery: 12,
  cunning: 8,
  healing: 12,
  knowledge: 8,
  connectedness: 12,
  arcadia: 6,
  load_limit: 12
)

g1 = Game.find_or_create_by(player: Player.find_by(name: "Mr. Bones"))

Node.all.each do |n|
  GameNode.find_or_create_by(node:n, game: g1)
end

g1.update(game_node: GameNode.find_by(game: g1, node: n1))

npc1 = Npc.find_or_create_by(label: "A talkative bear", description: "He is large, furry, and generally bear-like", assertive: true)
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

npc2 = Npc.find_or_create_by(label: "A reticent skeleton", description: "It is unusual to see bones so animated, but you have become resigned to the unusual", assertive: false)
NpcDialogue.find_or_create_by(npc: npc2, initial: true, seen: false, dialogue: "What sort of disturbance is this?")
NpcDialogue.find_or_create_by(npc: npc2, initial: false, seen: true, dialogue: "Why are you bothering me again?")

npc3 = Npc.find_or_create_by(label: "An aggressive ooze", description: "comes at you hissing", assertive: true, combatable: true)
npc3s = CharacterStat.find_or_create_by(stattable_type: 'Npc', stattable_id: npc3.id)
npc3s.update(
  health: 2,
  strength: 1,
  speed: 1,
  bravery: 12,
  cunning: 1,
  healing: 0,
  knowledge: 8,
  connectedness: 0,
  arcadia: 6,
  load_limit: 0
)

Npc.all.each do |n|
  GameNpc.find_or_create_by(npc:n, game: g1)
end

i1 = Item.find_or_create_by(label: "Oooo shiny", description: "shiny and round, of unknown origin and use", inspection: "You can see your reflection in the shiny round shiny. It still isn't clear what use it may have. It is light in your hands. You have a feeling it may reveal itself when the time is right.", weight: 1, packable: true, working: true)
i2 = Item.find_or_create_by(label: "Stringy bonky thing", description: "string-like thing that is also hard and possibly useful for bonks", inspection: "This may be a collapsible truncheon of some sort. It's woobly but has the character of being able to be wielded for bonking.", weight: 1, packable: true, working: true)
i3 = Item.find_or_create_by(label: "Jar of honey", description: "edible, with other possible uses", inspection: "Sticky.", weight: 1, packable: true, working: true)

Item.all.each do |n|
  GameItem.find_or_create_by(item:n, game: g1, equipped: false)
end

ne1 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n1), encounterable: GameItem.find_by(game: g1, item: i1), active: true)
ne2 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n1), encounterable: GameItem.find_by(game: g1, item: i2), active: true)

ne3 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n1), encounterable: GameNpc.find_by(game: g1, npc: npc1), active: true)
ne4 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n2), encounterable: GameNpc.find_by(game: g1, npc: npc2), active: true)
ne5 = GameEncounterable.find_or_create_by(game: g1, game_node: GameNode.find_by(game: g1, node: n2), encounterable: GameNpc.find_by(game: g1, npc: npc3), active: true)

