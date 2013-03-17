
Template.player.channels = ->
  ({ name: c, playing: c is Session.get('channel')} for c in _.keys(channels).sort())


Template.player.playing = ->
  this.name is Session.get 'channel'


Template.player.paused = ->
  not Session.get 'channel'



Template.player.events
  'click button': (e) ->
    evt = e
    id = if e.srcElement? then e.srcElement.id else e.currentTarget.id
    if id is 'stop'
      channel = ''
    else
      channel = id.split('-')[1]
    playChannel channel


playChannel = (channel) ->
  Session.set 'channel', channel
  location.href = '#' + channel
  document.title = channel + ' | radio.meteor.com'



Template.player.srcUrl = ->
  channel = Session.get 'channel'

  if channels[channel] is 'soma'
    "http://ice.somafm.com/" + channel
  else
    channels[channel]



Meteor.startup ->
  playChannel location.hash.slice(1)


Template.player.rendered = ->
  $('#player')[0].play()


networkStates =
  0: 'empty'
  1: 'idle'
  2: 'loading'
  3: 'no source'

readyStates =
  0: 'nothing'
  1: 'metadata'
  2: 'current'
  3: 'future'
  4: 'enough'




Meteor.setInterval ->
  player = $('#player')[0]

  if player?
    if player.currentTime
      $('#currentTime')[0].innerHTML = moment().subtract('seconds', Math.round player.currentTime).fromNow(true)
    if player.readyState
      $('#readyState')[0].innerHTML = readyStates[player.readyState]
    if player.networkState
      $('#networkState')[0].innerHTML = networkStates[player.networkState]

, 5000