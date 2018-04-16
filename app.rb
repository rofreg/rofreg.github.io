require 'sinatra'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/talks' do
  send_file File.join(settings.public_folder, 'talks', 'index.html')
end

get '/talks/rubyconf2017' do
  send_file File.join(settings.public_folder, 'talks', 'rubyconf2017.pdf')
end

get '/talks/railsconf2018' do
  send_file File.join(settings.public_folder, 'talks', 'railsconf2018.pdf')
end
