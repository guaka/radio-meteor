

currentChannel = ->
  name = Session.get 'channel'
  channels[name] if name



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
    mtrPlayer.setChannel (if id is 'stop' then '' else id.split('-')[1])


Template.player.srcUrl = ->
  if currentChannel()?.tags?.indexOf('soma') > -1
    "http://ice.somafm.com/" + Session.get 'channel'
  else
    currentChannel()?.url


Template.player.tags = ->
  if (channel = currentChannel()) is 'soma'
    'soma'
  else
    channel?.tags


Template.player.rendered = ->
  mtrPlayer.play()
