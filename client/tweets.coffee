
Twitter = new Meteor.Collection 'twitter'

Template.tweets.feed = ->
  data = Twitter.findOne {}
  console.log 'test', data
  if data
    $(data.content).find("entry").map ->
      o = {}
      el = $(this)
      o.author = el.find("author").text().
        replace(/\(.*\)/, '').
        replace(/http\:\/\/twitter.com\/.*/, '')
      o.title = el.find("title").text().
        replace( /\#nowplaying/, '').
        replace(/http\:\/\/t.co\/.*/, '')
      o

