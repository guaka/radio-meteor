
Twitter = new Meteor.Collection 'twitter'

do ->
  fetchTweets = ->
    Meteor.http.get 'http://search.twitter.com/search.atom?q=somafm', {}, (e, r) ->
      console.log 'fetched new tweets'
      Twitter.remove {}
      Twitter.insert content: r.content

  Meteor.startup ->
    fetchTweets()

  Meteor.setInterval fetchTweets, 30000

