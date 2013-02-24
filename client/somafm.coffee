
Template.somafm.channels =
  ['groovesalad', 'secretagent', 'dronezone', 'indiepop', 'cliqhop', 'beatblender', 'tags', 'illstreet', 'spacestation', 'doomed',
    'bootliquor', 'lush', 'digitalis', 'suburbsofgoa', 'u80s', 'sonicuniverse', 'poptron', 'covers', 'brfm', 'missioncontrol', '480min'].sort()

Template.somafm.events
  'click ul li a': (e) ->
    changeChannel(e.srcElement.href.split('#')[1])

changeChannel = (channel) ->
  if channel
    $('#somaframe').attr 'src', 'http://somafm.com/popup/?' + channel

Meteor.startup ->
  changeChannel(location.hash.slice(1))