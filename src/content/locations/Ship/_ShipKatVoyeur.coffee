# Prep for new ship talk. Main char Kat.
# I'm not a coffeescripter, so this code will probably need lots of help.
# Templated / Changed from ShipTalkSports

ShipJob.Talk.next.push Page.ShipTalkVoyeur = class ShipTalkVoyeur extends Page
  conditions:
    '|season': {eq: ['Wood', 'Fire']}
    Nat: '|officers|Nat'
    sailor: fill: ->
      return g.crew.asArray().sort((c1, c2)->c1.combat - c2.combat)[0]
    sailor2: fill: ->
      return g.crew.asArray().sort((c1, c2)->c1.combat - c2.combat)[1]
	# I suppose gender doesn't matter, but it will fit the text better if one is male and the other female.
  text: ->"""|| bg="Ship.deckNight"
        #{@Nat.image 'excited', 'left'}
    --
      #{@sailor} #{his} #{him} #{@sailor2} #{@sailor} #{@sailor} #{he} #{@sailor2}
  """
