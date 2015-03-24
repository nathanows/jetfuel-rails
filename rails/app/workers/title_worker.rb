class TitleWorker
  include Sidekiq::Worker

  def perform(url_id)
    url = Url.find_by(id: url_id)
    doc = Nokogiri::HTML(HTTParty.get(url.long))
    title = doc.css("title").first.child.text.tr("\n", " ").split.join(" ")
    url.update_column(:title, title)
  end
end
