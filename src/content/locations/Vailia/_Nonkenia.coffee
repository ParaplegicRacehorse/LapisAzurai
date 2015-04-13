Place.Nonkenia = Game::map.Nonkenia = class Nonkenia extends Place
  name: 'Nonkenia'
  description: "Despite a long-standing dispute with their Alkenian neighbors, Nonkenia maintains good relations with Vailia. Nonkenia considers itself the spiritual center for the continent, though their neighbors don't always agree. They export food and forest goods in return for manufactured goods."
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
    -- She sheek her head slowly, looked back down at her fire. <q>You're not the one I'm waiting for, but you are welcome to join me if you wish.</q>

  ||
    --> Strangely compelled by the scene, #{@worker} took a seat. #{q}What is this place? It's much older than the rest of the city.</q>

  ||
    -- She smiled. <q>It is. Much older. I don't know how old, don't ask,</q> she interrupted the upcoming question with a dry chuckle. <q>I just know that this place is waiting for someone, and you are not it. My grandson will be back soon, to take his turn at the watch. You should meet him, he's a nice boy.</q>

  ||
    --> #{q}How will you know who it's waiting for when they get here?</q>

  ||
    --> <q>I'll know.</q> She shrugged. <q>Well, probably not me. But my grandson, or his child, or his great-great grandson. We've watched this place for so long now, what's a few more centuries?</q> She repeated the shrug, fed the fire another log.
"""