# Prep for new ship talk. Main char Kat.
# I'm not a coffeescripter, so this code will probably need lots of help.
# Templated / Changed from ShipTalkSports

# Players #{@Kat} #{@sailor} #{@sailor2} #{he} #{his} #{him}

#
# PER BLUEWINDS
#A note on #{he} et all - if the person isn't specified, they use "the most recent person mentioned." So "#{@sailor}, #{he}" will use sailor1's gender, while #{@sailor} #{he @sailor2}" will use sailor2's.
#
#These are all defined at the top of https://github.com/ParaplegicRacehorse/LapisAzurai/blob/master/src/engine/classes/person.coffee, if you want to see the full list.
#

ShipJob.Talk.next.push Page.ShipTalkVoyeur = class ShipTalkVoyeur extends Page
  conditions:
    '|season': {eq: ['Wood', 'Fire']}
    Kat: '|officers|Kat'
    sailor: fill: ->
      return g.crew.asArray().sort((c1, c2)->c1.combat - c2.combat)[0]
    sailor2: fill: ->
      return g.crew.asArray().sort((c1, c2)->c1.combat - c2.combat)[1]
	# I suppose gender doesn't matter, but it will fit the text better if one is male and the other female.

# HELP PER BLUEWINDS:
# Since there aren't always crewmembers of each gender, maybe just don't have the event occur at all, unless it can find a matching-pair?
#
#   sailor:
#        fill: -> g.crew.find (c)-> c.gender is 'f'
#    sailor2:
#        fill: -> g.crew.find (c)-> c.gender is 'm'
#
#That'll get you one of each gender, and the event won't trigger if it can't find a person for each.

    # Also, I suppose this could be any officer, though if Nat, the Report option will need to be replaced with something else.
  text: ->"""|| bg="Ship.deckNight"
        #{@Kat.image 'normal', 'left'}
    --
      While on watch, Kat hears some sounds which don't fit in with the usual sounds of creaking timbers, rigging and luffing sails. She follows her ears to investigate. Inside the hold, she finds #{@sailor} and #{@sailor2}, unclothed and entwined with each other, bare skin glistening in beam of moonlight.
    # TODO choice [Watch, Join, Ignore, Report] with hints ['Indulge Kat's inner voyeur.' 'That looks like fun! Will they let her join them? 'Let them have some privacy.' 'Report them to the captain.']
#
#PER BLUEWINDS
# Player choices are one of the more complicated things. To start with, take a look at https://github.com/ParaplegicRacehorse/LapisAzurai/blob/master/src/content/people/Kat/_preRoute.coffee#L472.
#
# Notice how it extends PlayerOptionPage, instead of Page. Then, #514, the "options" function is included in the text - it takes the two arrays, one of button labels and the other of title-texts.
#
# Below that, "@next: {}" defines "next" as a class attribute, (next: {} would define it as an instance attribute).
#
# At #518, "Page.KatStorm2.next['Offer gift'] = " defines the result of the "Offer Gift" option. Since the initial event (where the player makes their choice) is "Page.KatStorm2", we're adding this new event to the "next" attribute of the class.
#
# So given the above comment, this should be
#   Page.ShipTalkVoyeur.next.Watch = Page.ShipTalkVoyeurWatch = class ShipTalkVoyeurWatch extends Page
# The three parts of that, in reverse order: 3) You are defining a new class, ShipTalkVoyeurWatch, which extends the Page class. 2) Adding it to the global list of all possible Pages, with the same name as its property name. 1) Adding it to the initial event's "next" object, as the item selected when the player chooses "Watch".
#
  """

ShipJob.Talk.next.push Page.ShipTalkVoyeur.Watch = class ShipTalkVoyeur extends Page
    text: ->"""||
    #   if exists "Ship.holdNight" then bg="Ship.holdNight"
    #   else bg="Ship.deckNight"
    --
        # TODO insert description here
"""

ShipJob.Talk.next.push Page.ShipTalkVoyeur.Join = class ShipTalkVoyeur extends Page
    text: ->"""||
    #   if exists "Ship.holdNight" then bg="Ship.holdNight"
    #   else bg="Ship.deckNight"
    --
        # TODO insert description here
"""


ShipJob.Talk.next.push Page.ShipTalkVoyeur.Ignore = class ShipTalkVoyeur extends Page
    text: ->"""||
    #   if exists "Ship.holdNight" then bg="Ship.holdNight"
    #   else bg="Ship.deckNight"
    --
        <q>Well, at least <strong>someone's</strong> having fun tonight.</q> Kat returned to her duties and tried to ignore the increasingly excited sounds eminating from the hold.
"""

ShipJob.Talk.next.push Page.ShipTalkVoyeur.Report = class ShipTalkVoyeur extends Page
    text: ->"""||
    #   if exists "Ship.holdNight" then bg="Ship.holdNight"
    #   else bg="Ship.deckNight"
    --
        # TODO insert description here
"""
