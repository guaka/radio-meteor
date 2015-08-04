Router.route '/', ->
  if location.hash
    Router.go '/' + location.hash.slice(1)

  @render 'home'
  mtrPlayer.setChannel ''

Router.route '/:_id', ->
  mtrPlayer.setChannel @params._id
  @render 'channel'

Router.configure 
  layoutTemplate: 'AppLayout'
