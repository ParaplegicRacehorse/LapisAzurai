# Prep for new ship talk. Main char Kat.
# I'm not a coffeescripter, so this code will probably need lots of help.
# Templated / Changed from ShipTalkSports

# Players #{@Kat} #{@sailor} #{@sailor2} #{he} #{his} #{him}

ShipJob.Talk.next.push Page.ShipTalkVoyeur = class ShipTalkVoyeur extends Page
  conditions:
    '|season': {eq: ['Wood', 'Fire']}
    Nat: '|officers|Kat'
    sailor: fill: ->
      return g.crew.asArray().sort((c1, c2)->c1.combat - c2.combat)[0]
    sailor2: fill: ->
      return g.crew.asArray().sort((c1, c2)->c1.combat - c2.combat)[1]
	# I suppose gender doesn't matter, but it will fit the text better if one is male and the other female.
    # Also, I suppose this could be any officer, though if Nat, the Report option will need to be replaced with something else.
  text: ->"""|| bg="Ship.deckNight"
        #{@Kat.image 'excited', 'left'}
    --
      While on watch, Kat hears some sounds which don't fit in with the usual sounds of creaking timbers, rigging and luffing sails. She follows her ears to investigate. Inside the hold, she finds #{@sailor} and #{@sailor2}, unclothed and entwined with each other, bare skin glistening in the starlight.
    # TODO choice [Watch, Ignore, Report] with hints ['Indulge Kat's inner voyeur.' 'Let them have some privacy.' 'Report them to the captain.']
  """

ShipJob.Talk.next.push Page.ShipTalkVoyeur.Watch = class ShipTalkVoyeur extends Page
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
        # TODO insert description here
"""

ShipJob.Talk.next.push Page.ShipTalkVoyeur.Report = class ShipTalkVoyeur extends Page
    text: ->"""||
    #   if exists "Ship.holdNight" then bg="Ship.holdNight"
    #   else bg="Ship.deckNight"
    --
        # TODO insert description here
"""
