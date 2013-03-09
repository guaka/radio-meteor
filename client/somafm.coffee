
Template.somafm.channels =
  channels.sort()

Template.somafm.events
  'click ul li a': (e) ->
    if e.srcElement?
      href = e.srcElement.href
    else
      href = e.currentTarget.href
    Session.set 'channel', href.split('#')[1]

Template.somafm.somaUrl = ->
  channel = Session.get 'channel'

  if channel is 'paradise'
    "http://scfire-m37.websys.aol.com:80/radio_paradise_mp3_128kbps"
  else
    "http://ice.somafm.com/" + channel


Meteor.startup ->
  Session.set 'channel', location.hash.slice(1)

Template.somafm.intro = ->
  if not Session.get('channel')
    'click on a channel to start listening'

Template.somafm.rendered = ->
  $('#player')[0].play()