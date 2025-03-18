# README

Data model fundamental: for many classes/entities, there are two versions e.g. `Foo` and `GameFoo`. `Foo` represents
the thing in its beginning state -- essentially these capture the "scenario" in game parlance. `GameFoo` represents
a version of `Foo` with state belonging to *an actual play(ed) game instance*. 

So, `Node` seed data would capture a starting template for a node. Then an individual in-progress game will create `GameNodes` as necessary that correspond to the scenario `Nodes` and capture state for that particular game. 

Right now these are tightly coupled. A `GameNode` for example delegates its `description` attribute to `Node`. So if the underlying node description changes, that change will be visible in in-progress games with a related `GameNode`. This might need to change in the future if we want to introduce e.g. versioning of scenarios that are opt-in for in-progress games. 

TODO: `game_foo` is used much more in the code than `Foo` so we should probably invert this relationship, so that `Foo` is understood to apply in a single game and the parent is something like `ScenarioFoo`. Would be a nice thing for brevity/code clarity. 

