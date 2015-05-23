Place.Nonkenia = Game::map.Nonkenia = class Nonkenia extends Place
  name: 'Nonkenia'
  description: "Despite a long-standing dispute with Alkenia, Nonkenia considers itself a spiritual center, though their neighbors don't always agree. They export food and forest goods in return for manufactured goods."
  images:
    day: 'game/content/locations/Wilds/Forest Day.jpg'
    night: 'game/content/locations/Wilds/Forest Night.jpg'
    storm: 'game/content/locations/Wilds/Forest Storm.jpg'
    marketDay: 'game/content/locations/Wilds/Forest Day.jpg'
    marketNight: 'game/content/locations/Wilds/Forest Night.jpg'
    marketStorm: 'game/content/locations/Wilds/Forest Storm.jpg'
    tavern: Place.Vailia::images.tavern
  jobs: new Collection
  location: [3378, 1704]
  destinations: new Collection
    MountJulia: 12
    Alkenia: 3

Place.Nonkenia::jobs.market = Job.NonkeniaMarket = class NonkeniaMarket extends Job.Market
  buy: new Collection
    "Naval Supplies": [10, -6]
    Wood: [40, 1]
    Fur: [10, -15]
    Barley: [35, -1]
    Wheat: [15, -2]
  sell: new Collection
    "Maiden's Tea": [20, 16]
    "Vailian Steel": [14, 25]
    "Trade Tools": [8, 40]

  description: ->"""There's a bit of a nervous air among those dealing with #{@worker} - while not considered wrong, per-se, dealing with Vailian merchants seems to have a bit of a questionable character to the Nonkenians. Money is money, though."""
  next: Page.Market

Place.Nonkenia::firstVisit = Page.VisitNonkenia = class VisitNonkenia extends Page
  conditions:
    Nat: '|officers|Nat'
  text: ->"""|| bg="night"
    -- The Lapis arrived late at night, slipping silently into sheltered bay that Natalie's maps insisted was the center of Nonkenia. Hard to believe that this empty expanse of sand, much like hundreds of others they'd already sailed past, was something special.
  ||
    --> The signs were there, though, obvious enough to careful eyes as the crew lowered the anchors. There was no dock, but the beach was broken with ridges and piles of sand, as though heavy objects had been dragged over it recently. And the forest was thinner, less overgrown - Natalie would bet good money that trails leading inland would be visible in the morning.
  ||
    -- Lowering a boat into the water, Natalie felt as if eyes were twinkling at them from the edge of the forest - a feeling confirmed as soon as they set foot on the beach, when an old man emerged from his hiding place to greet them.
  ||
    --> <q>Good evening. May I request an hour of your time before you enter the forst? It is dangerous at this time of night.</q> Cracked and wizened with age, Natalie found his voice disturbing, threatening even, but pushed down her reaction and forced a smile.
  ||
    #{@Nat.image 'normal', 'left'}
    --> #{q}Of course. I'm Natalie, this is James, and...</q>
  ||
    -- <q>Stop! Do not share your names so easily. Some might think you tried to ensnare them into reciprocating. Not me, of course. I am used to the ways of foreigners, and know you mean no harm,</q> he gave a dry chuckle, and Natalie bit her tongue to avoid saying anything unfriendly. <q>What brings you to the shores of Nonkenia?</q>
  ||
    #{@Nat.image 'normal', 'left'}
    --> #{q}We come seeking opportunity for trade and mutual profit. I have a cargo hald full of things I think you might be interested in. But I was expecting a city, and all I see is an empty beach?</q>
  ||
    -- He chuckled again, and she couldn't help feeling like she was being mocked. <q>Of course you do. I'd be a fool to expect anything else from a Vailian. Too much to hope for that you'd come to visit one of our grand temples, or repent from some devilry or other...</q> he continued to mutter as he took a jar at his hip and popped off the lid. Dipping a finger in, he reached towards her, something sticky looking - honey perhaps - dripping from his finger. <q>Bend down, there's a good girl, I'm not as tall as I used to be.</q>
  ||
    --> She did as he asked, and he left a sticky dot on her forehead. He swatted away her finger when she reached up to wipe it away.
  ||
    -- <q>There you go, girl. The forest isn't dangerous anymore. For you. As long as you take the left trail, then left fork, then right. Got that? Left, left, right.</q> Another dry chuckle, a sound Natalie was beginning to thoroughly loathe. <q>Anyone else who feels like walking to the city, come and take your turn. You can wipe it off once you're inside the city, but make sure you get announted again before you try and return to the ship. It'd be a shame if some of you didn't make it back.</q>
"""

Place.Nonkenia::jobs.rest = Job.NonkeniaRest = class NonkeniaRest extends Job
  officers:
    worker: {}
    worker2: {optional: true}
    worker3: {optional: true}
  label: 'Rest'
  text: ->"""Stroll through the forest - it's safe here, the locals claim, despite appearances."""
  energy: 3
  next: Page.randomMatch
  @next: []

Job.NonkeniaRest.next.push Page.NonkeniaRest = class NonkeniaRest extends Page
  conditions:
    worker: {}
  text: ->"""|| bg="day|storm"
    -- #{@worker} meandered through Nonkenia, exploring the area and people-watching. Eventually #{he} found himself in a quieter part of the town, out of sight of the main roads and walking through increasingly narrow passages between poorly maintained buildings.

  ||
    --> A building of a different sort caught #{his} eye - stone, ancient stone, weathered with a light coating of moss in some places and rivulets carved down the surface of the rock as though by untold years of rain. The door was open, and from the dimly lit recesses wafted the scent of a pleasant wood fire. #{@worker} entered.

  ||
    -- The doorway opened to a small chamber, windowless, lit only by a small fire. Curls of smoke drifted towards a hole in the ceiling, and on the opposite side from the entrance sat an old woman. The patched shawl wrapped over her shoulders had seen better days.

  ||
    --> #{q}Hello?</q> #{@worker} greeted her, falling silent as the old woman looked up with a rheumy stare.

  ||
    --> She sheek her head slowly, looked back down at her fire. <q>You're not the one I'm waiting for, but you are welcome to join me if you wish.</q>

  ||
    -- Strangely compelled by the scene, #{@worker} took a seat. #{q}What is this place? It's much older than the rest of the city.</q>

  ||
    --> She smiled. <q>It is. Much older. I don't know how old, don't ask,</q> she interrupted the upcoming question with a dry chuckle. <q>I just know that this place is waiting for someone, and you are not it. My grandson will be back soon, to take his turn at the watch. You should meet him, he's a nice boy.</q>

  ||
    --> #{q}How will you know who it's waiting for when they get here?</q>

  ||
    -- <q>I'll know.</q>

  ||
    -- <q>I'll know.</q> She shrugged. <q>Well, probably not me. But my grandson, or his child, or his great-great grandson. We've watched this place for so long now, what's a few more centuries?</q> She repeated the shrug, fed the fire another log.
"""
