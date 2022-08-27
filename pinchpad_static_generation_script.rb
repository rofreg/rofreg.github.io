#!/usr/bin/env ruby

require 'json'
require 'time'

posts = JSON.parse(File.read('./pinchpad_raw_data.json')); nil
posts.each { |post| post['created_at'] = Time.parse(post['created_at']) }; nil

posts_by_date = posts.group_by do |post|
  post['created_at'].to_date
end; nil

sorted_dates = posts_by_date.keys.sort; nil
puts sorted_dates

posts_by_date.keys.sort.each do |date|
  posts = posts_by_date[date].sort_by { |post| post['created_at'] }
  posts_htmls = posts.map do |post|
    "<li class='post'>  
          <section class='media'>
            <a href='http://www.pinchpad.com'><img src='#{post['image']['url']}'></a>
          </section>
          <section class='caption_and_post_info'>
            <ul class='post_info'>
              <li><img src='date.png'>#{date.strftime('%a, %B %e, %Y')}</li>
              <li><img src='time.png'>#{post['created_at'].strftime('%l:%M%p')}</li>
            </ul>
          </section>
        </li>"
  end

  html_string = "<!DOCTYPE html>
<html>
  <head>
    <title>Pinch Pad</title>
    <meta charset='utf-8'>
    <meta name='description' content='Journal comics by Ryan Laughlin. One new comic per hour, all month. Also on Twitter: @pinchpad.' />
    <link href='style.css' rel='stylesheet' type='text/css'>
  </head>
  <body>
    <section id='container'>
      <header id='header'>
        <section id='blog_info'>
          <h1>
            <a href='/'><img src='app_icon.png'> Pinch Pad</a> 
          </h1>
          <div class='description'>
            Journal comics by <a href='https://rofreg.com'>Ryan Laughlin</a>.
            One new comic per hour, all month.
            Also on Twitter: <a href='https://twitter.com/pinchpad'>@pinchpad</a>
          </div>
        </section>
        <h2>
          #{date.strftime('%A, %B %e, %Y')}
        </h2>
      </header>

      <ul id='posts'>
        #{posts_htmls.join("\n")}
      </ul>
    </section>
  </body>
</html>
"

  File.write("./pinchpad/#{date}.html", html_string)
end
