class ZozoScraping

  def self.fetch_wear_page(url=nil)
    Slack.configure do |config|
      config.token = ENV['SLACK_OAUTH_ACCESS_TOKEN']
    end
    client = Slack::Web::Client.new
    agent = Mechanize.new
    page = agent.get(url)
    item_snaps = page.search(".like_mark")

    json_url = "https://wear.jp/common/json/coordinate_items.json?snap_ids="
    item_snaps.each do |item_snap|
      snap_id = item_snap.attributes["data-snapid"].value
      json_url += snap_id + ","
    end

    json_url = json_url.chop

    uri = URI.parse(json_url)
    json = Net::HTTP.get(uri)

    # # # ブランド名、値段、zozowownへのリンクがあるかどうか検索。
    cordinate_datas = JSON.parse(json)
    hoge = []
    cordinate_datas.each do |cordinate_data|
      cordinate_data['lists'].each.with_index(2) do |list, i|
        list['items'].each do |item|
          hoge << "ブランド: " + item['brand_name']
        end
      end
    end
    p "slack_message"
    client.chat_postMessage(
      as_user: 'true',
      channel: '#zozo_scraping',
      text: 'suc'
    )
    # puts hoge.join("\n")
  end
end
