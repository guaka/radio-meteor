Router.route '/', ->
  if location.hash
    Router.go '/' + location.hash.slice(1)
  @render 'home'
  mtrPlayer.setChannel ''
  _gaq.push ['_trackPageview']

Router.route '/:channel', ->
  channel = @params.channel
  mtrPlayer.setChannel channel
  document.title = channel + ' | radio.meteor.com'
  @render 'channel'
  _gaq.push ['_trackPageview']


Router.configure 
  layoutTemplate: 'AppLayout'
