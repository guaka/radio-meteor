
@Twitter = Twitter = new Meteor.Collection 'twitter'

do ->
  fetchTweets = ->
    Twitter.remove {}

    # Radio Paradise playlist tweets
    #Meteor.http.get 'https://api.twitter.com/1/statuses/user_timeline.rss?screen_name=rp_playlist&count=1', {}, (e, r) ->
    #  console.log r.content
    #  Twitter.insert content: r.content

    Meteor.http.get 'http://search.twitter.com/search.atom?q=somafm', {}, (e, r) ->
      console.log 'fetched new tweets'
      Twitter.insert content: r.content

  Meteor.startup ->
    fetchTweets()

  Meteor.setInterval fetchTweets, 20000
