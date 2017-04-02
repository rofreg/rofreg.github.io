require 'twitter'
require 'irb'
$stdout.sync = true

SEGMENT_COUNT = 20
SEGMENT_REPRESENTS = 100 / SEGMENT_COUNT.to_f

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["POTUS_TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["POTUS_TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["POTUS_TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["POTUS_TWITTER_ACCESS_TOKEN_SECRET"]
end

start_time = Time.new(2017,1,20,17,0,0,"+00:00")
end_time = Time.new(2021,1,20,17,0,0,"+00:00") #🤞

percent_elapsed = ((Time.now - start_time) / (end_time - start_time) * 100).floor
progress_bar = SEGMENT_COUNT.times.collect{|segment| percent_elapsed > (segment + 0.5)*SEGMENT_REPRESENTS ? "▓" : "░"}.join
percent_elapsed_string = " #{percent_elapsed}%"
new_tweet_text = "#{progress_bar}#{percent_elapsed_string}"

recent_tweets = client.user_timeline("potus_progress", exclude_replies: true, count: 100)
latest_tweet = recent_tweets.find{|tweet| tweet.text[/[0-9]%$/]}

if latest_tweet&.text&.end_with?(percent_elapsed_string)
  puts "No tweet necessary at this time"
else
  puts "Tweeting update: #{new_tweet_text}"
  client.update(new_tweet_text)
end
