require 'numbers_in_words'
require 'numbers_in_words/duck_punch'

# Load the enabled modules.
  Dir[File.join(File.dirname(__FILE__), '/modules/enabled/*.rb')].each do |file|
    require_relative file
  end

connection = Helpers::Connection.new()
connection.login
def process_query(command)
  puts "Running command #{command}"
  case
    when command.match(/shut/)
      shutdown
    when command.match(/temperature|nest/)
      process_temperature(command)
    when command.match(/light|lights/)
      process_lights(command)
    when command.match(/river/)
      process_player(command, player: "iriver")
    when command.match(/tweet/)
      tepuy_process_ifttt_tweet(command)
    else
      'No command'
  end
end

def shutdown
  puts 'Shutting down'
  exit!
end

@old_activity = nil
while (true)

  last_activity = connection.get_activity_description_summary
  if @old_activity.nil?
    @old_activity = last_activity
    process_query(last_activity)
  end
  process_query(last_activity) unless @old_activity == last_activity
  puts 'Waiting for new command' if @old_activity == last_activity
  @old_activity = last_activity
  sleep(10)

end
