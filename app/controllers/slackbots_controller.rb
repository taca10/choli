class SlackbotsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def test
  end

  def event
    @body = JSON.parse(request.body.read)
    # if @body['event']['type'] == 'message' && @body['event']['text'].include?('<@US68T0M1Q>')
      case @body['type']
      when 'url_verification'
        render json: @body
      when 'event_callback'

      render status: 200, json: { status: 200 }
        Slack.configure do |config|
          config.token = ENV['SLACK_OAUTH_ACCESS_TOKEN']
        end
        client = Slack::Web::Client.new
        client.chat_postMessage(
            as_user: 'true',
            channel: '#zozo_scraping',
            text: 'suc'
        )
        # ZozoScraping.fetch_wear_page("https://wear.jp/men-category/tops/knit-sweater/")
      end
    # else
      # p "slack_message_fail"
      head :ok
    # end
  end
end
