
@Twitter = Twitter = new Meteor.Collection 'twitter'

tweets = null
Template.tweets.feed = ->
  data = Twitter.findOne {}
  if data
    tweets = $(data.content).find("entry").map ->
      o = {}
      el = $(this)
      author = el.find("author").text()
      o.author = author.
        replace(/\(.*\)/, '').
        replace(/http\:\/\/twitter.com\/.*/, '')
      o.title = el.find("title").text().
        replace( /\#nowplaying/, '').
        replace(/http\:\/\/t.co\/.*/, '').
        replace(/[^\w\s]/gi, '')
      o
  tweets