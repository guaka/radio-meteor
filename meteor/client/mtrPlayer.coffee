

# Good read: http://html5doctor.com/html5-audio-the-state-of-play/

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




@mtrPlayer = mtrPlayer = new class MeteorPlayer
  readyState: null
  networkState: null

  # Add methods:
  # stop()
  # play()

  audioTag: ->
    $('#player')[0]

  constructor: ->
    Meteor.startup ->
      mtrPlayer.setChannel location.hash.slice(1)

    Meteor.setInterval ->
      if mtrPlayer.audioTag()
        mtrPlayer.checkStatus()
    , 7000

  play: =>
    @audioTag()?.play()


  setChannel: (channel) ->
    @readyState = @networkState = null
    Session.set 'channel', channel

    @audioTag()?.pause()
    Meteor.setTimeout (=>
      @audioTag()?.load()
      @audioTag()?.play()
    ), 10

    location.href = '#' + channel
    document.title = channel + ' | radio.meteor.com'


  checkStatus: =>
    newNetworkState = @audioTag().networkState
    newReadyState = @audioTag().readyState

    # @audioTag().volume = 1
    @play()

    if @readyState? and
        newReadyState is @readyState and
        [0, 1].indexOf(newReadyState) > -1 and
        newNetworkState isnt 2
      console.log 'Restart channel'
      @readyState = @networkState = null
      @setChannel Session.get 'channel'

    else
      if newReadyState
        $('#readyState')[0].innerHTML = readyStates[newReadyState]
      if newNetworkState
        $('#networkState')[0].innerHTML = networkStates[newNetworkState]

      @readyState = newReadyState
      @networkState = newNetworkState

