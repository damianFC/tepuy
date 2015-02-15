module Helpers
  def self.c_present?(command, term)
    command.scan(/#{term}/).length > 0
  end

  class Connection
    require 'nokogiri'
    require 'mechanize'
    require 'json'

    attr_accessor :agent

    def initialize ()
      @agent = Mechanize.new
      @agent.user_agent_alias = 'Windows IE 9'
    end

    def login
      page = @agent.get('https://www.amazon.com/ap/signin?openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.assoc_handle=amzn_dp_project_dee&openid.return_to=https%3A%2F%2Fpitangui.amazon.com&')
      form = page.form('signIn')
      form.email = ENV['AMAZON_EMAIL']
      form.password = ENV['AMAZON_PASSWORD']
      @agent.submit(form)
      # Add validation of login here.
    end

    # Returns a JSON object with all devices.
    def get_device
      page = @agent.get('https://pitangui.amazon.com/api/devices/device')
      JSON.parse(page.body)
    end

    def get_activity
      page = @agent.get('https://pitangui.amazon.com/api/activities?startTime=&size=1&offset=1')
      JSON.parse(page.body)
    end

    def get_activity_description
      activities = get_activity
      JSON.parse(activities['activities'][0]['description'])
    end

    def get_activity_description_summary
      activity_description = get_activity_description
      activity_description['summary']
    end
  end
end