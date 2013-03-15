
Template.player.channels = ->
  ({ name: c, playing: c is Session.get('channel')} for c in channels.sort())


Template.player.playing = ->
  this.name is Session.get 'channel'


evt = null

Template.player.events
  'click button': (e) ->
    evt = e
    id = if e.srcElement? then e.srcElement.id else e.currentTarget.id
    if id is 'stop'
      channel = ''
    else
      channel = id.split('-')[1]
    Session.set 'channel', channel
    location.href = '#' + channel


Template.player.srcUrl = ->
  channel = Session.get 'channel'

  if channel is 'paradise'
    "http://scfire-m37.websys.aol.com:80/radio_paradise_mp3_128kbps"
  else
    "http://ice.somafm.com/" + channel


Meteor.startup ->
  Session.set 'channel', location.hash.slice(1)


Template.player.rendered = ->
  $('#player')[0].play()

Template.player.state = ->
  #  # + ' ' + readyStates[Session.get 'readyState']
  #  #networkStates[Session.get 'networkState']
  ''


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
  # Session.set 'networkState', $('#player')[0].networkState
  timePlayed = $('#player')[0]?.currentTime
  if timePlayed
    $('#currentTime')[0].innerHTML = moment().subtract('seconds', Math.round timePlayed).fromNow(true)
, 5000