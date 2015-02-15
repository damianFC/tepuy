require 'gmail'

# Should probably include recipes in here.
def tepuy_process_ifttt_tweet(command)
  puts 'Processing tweet'

  gmail = Gmail.new(ENV['GMAIL_EMAIL'], ENV['GMAIL_PASS'])
  gmail.deliver do
    to "#{ENV['GMAIL_EMAIL']}"
    subject "echo tweet #{ENV['GMAIL_SEED']}"
    text_part do
      body "#{command.split(' ')[1..-1].join(' ')}"
    end
  end
  gmail.logout
end
