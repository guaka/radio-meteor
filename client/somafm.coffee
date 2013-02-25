
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
  if channel
    'http://somafm.com/popup/?' + channel

Meteor.startup ->
  Session.set 'channel', location.hash.slice(1)

Template.somafm.intro = ->
  if not Session.get('channel')
    'click on a channel to start listening'
