require 'sinatra'

require './helpers'

#require './modules/lights'
#require './modules/temperature'
#require './modules/iRiver_player'

require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

# Load the enabled modules.
configure do
  Dir[File.join(File.dirname(__FILE__), '/modules/enabled/*.rb')].each do |file|
    require_relative file
  end

end


def process_query(command)
  # HUE LIGHTS #
  if command.scan(/light|lights/).length > 0
    process_lights(command)
  # NEST #
  elsif command.scan(/temperature|nest/).length > 0
    process_temperature(command)
  elsif command.scan(/river/).length > 0
    process_player(command, player: "iriver")
  elsif command.scan(/put/).length >0
    tepuy_process_console(command)
  elsif command.scan(/tweet/).length > 0
    tepuy_process_ifttt_tweet(command)
  end

end

def shutdown
  puts 'Shutting down'
  exit!
end

get '/command' do
  process_query(params[:q])
end

get '/status' do
  status 200
end
