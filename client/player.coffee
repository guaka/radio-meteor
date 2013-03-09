
Template.player.channels =
  channels.sort()

Template.player.events
  'click ul li a': (e) ->
    if e.srcElement?
      href = e.srcElement.href
    else
      href = e.currentTarget.href
    Session.set 'channel', href.split('#')[1]

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