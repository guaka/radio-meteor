Router.route '/', ->
  if location.hash
    Router.go '/' + location.hash.slice(1)

  @render 'home'
  mtrPlayer.setChannel ''

Router.route '/:channel', ->
  channel = @params.channel
  mtrPlayer.setChannel channel
  document.title = channel + ' | radio.meteor.com'
  @render 'channel'

Router.configure 
  layoutTemplate: 'AppLayout'
