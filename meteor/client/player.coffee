

currentChannel = ->
  name = Session.get 'channel'
  channels[name] if name


Template.player.helpers
  channels: ->
    ({ name: c, playing: c is Session.get('channel')} for c in _.keys(channels).sort())

  playing: ->
    this.name is Session.get 'channel'

  paused: ->
    not Session.get 'channel'

  srcUrl: ->
    if currentChannel()?.tags?.indexOf('soma') > -1
      "http://ice.somafm.com/" + Session.get 'channel'
    else
      currentChannel()?.url

  tags: -> 
    if (channel = currentChannel()) is 'soma'
      'soma'
    else
      channel?.tags



Template.player.events
  'click button': (e) ->
    evt = e
    id = if e.srcElement? then e.srcElement.id else e.currentTarget.id
    mtrPlayer.setChannel (if id is 'stop' then '' else id.split('-')[1])
  'keydown div': (e) ->
    console.log e




Template.player.rendered = ->
  mtrPlayer.play()
  $('body').on 'keydown', (e) ->
    console.log 'key pressed', e
    if e.keyCode == 39
      nextChannel 1
    if e.keyCode == 37
      nextChannel -1

nextChannel = (n = 1) ->
  chnSorted = _.keys(channels).sort()
  chnSorted.unshift ''   # Silence at beginning of list
  num = n + _.indexOf(chnSorted, Session.get 'channel')
  console.log 'num', num
  if num > chnSorted.length
    num = 0
  if num < 0
    num = chnSorted.length - 1
  Session.set 'channel', chnSorted[num]


