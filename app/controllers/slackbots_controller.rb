class SlackbotsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def test
    # z = ZozoScraping.new
    # z.delay.fetch_wear_date
    # p "test"
     ZozoScraping.fetch_wear_page("https://wear.jp/men-category/tops/knit-sweater/")
  end

  def event
    @body = JSON.parse(request.body.read)
    if @body['type'] == 'url_verification'
      return render json: @body['challenge']
    end
    if @body['event']['type'] == 'message' && @body['event']['text'].include?('<@US68T0M1Q>')
      case @body['type']
      when 'event_callback'
        ZozoScraping.delay.fetch_wear_page("https://wear.jp/men-category/tops/knit-sweater/")
      end
    end
  end
end
