class FeedEntry < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode
  mount_uploader :image_craigslist, ImageCraigslistUploader

def self.update_from_feed(url = "http://vancouver.craigslist.ca/search/apa?format=rss")
  feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.first(30).each do |entry|
      address_entry = entry.title.scan(/\(([^\)]+)\)/).last
      # or .try(:first)
      address = address_entry ? address_entry.first : ""

      # byebug
      unless exists? guid: entry.id
          create!(
           title:                        entry[:title],
           description:                  entry[:summary],
           url:                          entry[:url],
           published_date:               entry[:published],
           guid:                         entry[:url],
           price:                        entry[:title],
           remote_image_craigslist_url:  entry[:img],
           address:                      address
           )
         end
       end
     end

def self.update_from_kijiji( url = "http://www.kijiji.ca/rss-srp-apartments-condos/vancouver/c37l1700287")

  feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.first(30).each do |entry|
      unless exists? guid: entry.id
        create!(
        title:                          entry[:title],
        description:                    entry[:summary],
        url:                            entry[:url],
        published_date:                 entry[:published],
        guid:                           entry[:entry_id]
        )
      end
    end
  end

  def self.search(item)
    search_term = "%#{item}%"
    where(["title ILIKE :term  OR description ILIKE :term", {term: search_term}])
  end

end
