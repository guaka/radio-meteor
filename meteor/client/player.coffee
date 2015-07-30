

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

Template.player.rendered = ->
  mtrPlayer.play()
  $('body').on 'keydown', (e) ->
    switch e.keyCode
      when 39 then nextChannel 1
      when 37 then nextChannel -1
      when 38 then volChange .1
      when 40 then volChange -.1
      when 32 then mtrPlayer.setChannel ''
      else
        if e.keyCode >= 65 and e.keyCode <= 90 and e.altKey
          char = String.fromCharCode(e.keyCode + 32)
          console.log char
          for c in _.keys(channels).sort()
            if char is c[0]
              mtrPlayer.setChannel c
              break
        
volChange = (d) ->
  vol = $('audio')[0].volume
  vol += d
  $('audio')[0].volume = Math.max(0, Math.min(vol, 1))


nextChannel = (n = 1) ->
  chnSorted = _.keys(channels).sort()
  chnSorted.unshift ''   # Silence at beginning of list
  num = n + _.indexOf(chnSorted, Session.get 'channel')
  console.log 'num', num
  if num > chnSorted.length
    num = 0
  if num < 0
    num = chnSorted.length - 1
  mtrPlayer.setChannel chnSorted[num]

