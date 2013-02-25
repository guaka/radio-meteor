
Template.somafm.channels =
  [ 'secretagent'
    'illstreet', 'spacestation', 'doomed'
    'bootliquor', 'lush'
    'u80s', 'sonicuniverse', 'poptron', 'covers'
    'brfm', 'missioncontrol'

  # offline
  # 480min, tags

  # checked
    'groovesalad'
    'dronezone'
    'indiepop'
    'beatblender'
    'digitalis'
    'suburbsofgoa'

  # latest added:
    'bagel', 'sf1033'
  ].sort()

Template.somafm.events
  'click ul li a': (e) ->
    Session.set 'channel', e.srcElement.href.split('#')[1]

Template.somafm.somaUrl = ->
  channel = Session.get 'channel'
  if channel
    'http://somafm.com/popup/?' + channel

Meteor.startup ->
  Session.set 'channel', location.hash.slice(1)

Template.somafm.intro = ->
  if not Session.get('channel')
    'click on a channel to start listening'
