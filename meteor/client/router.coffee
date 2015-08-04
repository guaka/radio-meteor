Router.route '/', ->
  @render 'home'
  mtrPlayer.setChannel ''

Router.route '/:_id', ->
  mtrPlayer.setChannel @params._id
  @render 'channel'

Router.configure 
  layoutTemplate: 'AppLayout'
