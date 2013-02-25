
Template.somafm.channels =
  ['groovesalad', 'secretagent', 'dronezone',
   'indiepop', 'cliqhop', 'beatblender', 'tags',
   'illstreet', 'spacestation', 'doomed',
   'bootliquor', 'lush', 'digitalis', 'suburbsofgoa',
   'u80s', 'sonicuniverse', 'poptron', 'covers',
   'brfm', 'missioncontrol', '480min'].sort()

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
