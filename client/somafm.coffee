
Template.somafm.channels =
  ['groovesalad', 'secretagent', 'dronezone', 'indiepop', 'cliqhop', 'beatblender', 'tags', 'illstreet', 'spacestation', 'doomed',
    'bootliquor', 'lush', 'digitalis', 'suburbsofgoa', 'u80s', 'sonicuniverse', 'poptron', 'covers', 'brfm', 'missioncontrol', '480min']

Template.somafm.events
  'click ul li a': (e) ->
    changeChannel()

changeChannel = ->
  channel = location.hash.slice(1)
  $('#somaframe').attr 'src', 'http://somafm.com/popup/?' + channel
