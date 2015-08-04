

currentChannel = ->
  name = Session.get 'channel'
  if name
    channels[name].name = name
    channels[name]


Template.player.helpers
  channels: ->
    { name: c, playing: c is Session.get('channel') } for c in _.keys(channels).sort()

  playing: ->
    this.name is Session.get 'channel'

  paused: ->
    not Session.get 'channel'

  srcUrl: ->
    if currentChannel()?.tags?.indexOf('soma') > -1
      currentChannel().site = 'http://somafm.com/'
      currentChannel().twitter = 'https://twitter.com/somafm'
      currentChannel().facebook = 'https://facebook.com/somafm'
      "http://ice.somafm.com/" + Session.get 'channel'
    else
      currentChannel()?.url

  channel: ->
    currentChannel()




    

Template.player.rendered = ->
  $('body').on 'keydown', (e) ->
    switch e.keyCode
      when 39 then nextChannel 1
      when 37 then nextChannel -1
      when 38 then volChange .1
      when 40 then volChange -.1
      when 32 then Router.go '/'
      else
        if e.keyCode >= 65 and e.keyCode <= 90 and e.altKey
          char = String.fromCharCode(e.keyCode + 32)
          console.log char
          for c in _.keys(channels).sort()
            if char is c[0]
              Router.go '/' + c
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
  Router.go '/' + chnSorted[num]

