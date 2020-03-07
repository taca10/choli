class ZozoScraping

  def self.fetch_wear_page(url=nil)
    agent = Mechanize.new
    # p 'sucess'
    agent.user_agent_alias = 'Windows Mozilla'
    ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.100 Safari/537.36"
    agent.user_agent = ua
    p url
    page = agent.get(url)
    p 'sucess1'
    # item_snaps = page.search(".like_mark")

    # category_id = page.search(".coordinate")[0].attributes['data-categoryid'].value
    # sleep(3)
    p 'sucess3'

    # item_imgs = page.search(".image .img img")
    # images = []
    # item_imgs.each.with_index(2) do |item_img, i|
    #   images << "https:" + item_img.attributes["data-originalretina"].value
    # end

    # p 'sucess3'

    # hoge = []
    # json_url = "https://wear.jp/common/json/coordinate_items.json?snap_ids="
    # item_snaps.each do |item_snap|
    #   snap_id = item_snap.attributes["data-snapid"].value
    #   json_url += snap_id + ","
    #   hoge << snap_id
    # end
    # p 'sucess4'
    # json_url = "#{json_url.chop}&category_id=#{category_id}"

    # uri = URI.parse(json_url)
    # json = Net::HTTP.get(uri)

    # # ブランド名、値段、zozowownへのリンクがあるかどうか検索。
    # cordinate_datas = JSON.parse(json)
    # post_texts = []
    # p 'sucess5'
    # cordinate_datas.each do |cordinate_data|
    #   cordinate_data['lists'].each.with_index(0) do |list, i|
    #     list['items'].each do |item|
    #       if item['brand_name'].include?("&#") || item['ec_list'].blank?
    #         next
    #       end
    #       post_texts << "ブランド: " + item['brand_name'] \
    #       + " \n値段: "     + item['price'] \
    #       + " \n画像: "     + " https:" + item['item_image_215_url'] \
    #       + " \n着用画像: "  + " #{images[i]}"
    #     end
    #   end
    # end
    # post_texts = post_texts.each_slice(2).to_a
    # post_texts = post_texts[0]

    # p post_texts

    Slack.configure do |config|
      config.token = ENV['SLACK_OAUTH_ACCESS_TOKEN']
    end
    client = Slack::Web::Client.new

    # post_texts.each do |post_text|
      client.chat_postMessage(
        as_user: 'true',
        channel: '#zozo_scraping',
        text: 'suc'
      )
    # end


    # post_texts = ["https://cdn.wimg.jp/closet/z9g6vc/20191110232353870_500.jpg", "https://c.imgz.jp/721/24327721/24327721B_20_D_500.jpg", "https://cdn.wimg.jp/closet/19fakx/20200215044157269_500.jpg"]

    # client.chat_postMessage(
    #   as_user: 'true',
    #   channel: '#zozo_scraping',
    #   text: post_texts.join("\n")
    # )
    p "slack_message"
    # client.chat_postMessage(
    #   as_user: 'true',
    #   channel: '#zozo_scraping',
    #   text: hoge.join("\n")
    # )
    # puts hoge.join("\n")
  end

  def fetch_wear_date
    sleep(3)
    p 'before_aciton fetch_wear_date'
  end
end
