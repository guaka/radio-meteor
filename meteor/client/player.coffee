
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
  readyState = null
  networkState = null

  Session.set 'channel', ''
  # Attempt at making things more robust
  Meteor.setTimeout (-> Session.set 'channel', channel), 200

  location.href = '#' + channel
  document.title = channel + ' | radio.meteor.com'

  # Good read: http://html5doctor.com/html5-audio-the-state-of-play/


currentChannel = ->
  name = Session.get 'channel'
  channels[name] if name



Template.player.srcUrl = ->
  if currentChannel()?.tags?.indexOf('soma') > -1
    "http://ice.somafm.com/" + Session.get 'channel'
  else
    currentChannel()?.url


Template.player.tags = ->
  channel = currentChannel()
  if channel is 'soma'
    'soma'
  else
    channel?.tags



Meteor.startup ->
  playChannel location.hash.slice(1)


Template.player.rendered = ->
  console.log 'trying to .play()'
  $('#player')[0]?.play()


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





readyState = networkState = null
Meteor.setInterval ->
  player = $('#player')[0]

  if player?
    newNetworkState = player.networkState
    newReadyState = player.readyState

    console.log 'net', newNetworkState, networkState, 'ready', newReadyState, readyState

    if readyState? and newReadyState is readyState and [0, 1].indexOf(newReadyState) > -1 and newNetworkState isnt 2
      console.log 'trying to restart channel'
      readyState = networkState = null
      playChannel Session.get 'channel'

    if player.currentTime
      $('#currentTime')[0].innerHTML = moment().subtract('seconds', Math.round player.currentTime).fromNow(true)

    if newReadyState
      $('#readyState')[0].innerHTML = readyStates[newReadyState]
    if newNetworkState
      $('#networkState')[0].innerHTML = networkStates[newNetworkState]

    readyState = newReadyState
    networkState = newNetworkState

, 5000
