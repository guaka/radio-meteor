
Template.somafm.channels =
  [
  # offline
  # 480min tags sonicuniverse

  # checked
    'secretagent'
    'illstreet', 'spacestation', 'doomed'
    'missioncontrol'
    'beatblender'
    'bootliquor'
    'brfm'
    'covers'
    'digitalis'
    'dronezone'
    'groovesalad'
    'indiepop'
    'lush'
    'poptron'
    'suburbsofgoa'
    'u80s',

  # latest added:
    'bagel', 'sf1033'
  ].sort()

Template.somafm.events
  'click ul li a': (e) ->
    console.log e
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
