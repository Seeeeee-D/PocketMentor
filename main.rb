require './twitter_client'
require './google_api'
require './firestore_client'

# Twitterインスタンス
# 暇ツイート取得の動作確認
twitter_client = TwitterClient.new()
boredTweets = twitter_client.getBoredTweets(2)
boredTweets.each do |tweet|
    puts tweet.user.screen_name
    puts tweet.text
end
twitter_client.setRecentTweet(boredTweets[0].id)

# Firestoreの動作確認
firestore_client = FirestoreClient.new()
tweets = twitter_client.getReplies
tweets.each do | tweet | 
    firestore_client.saveUser(tweet)
    firestore_client.saveTweet(tweet)
end
