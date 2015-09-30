class FeedEntry < ActiveRecord::Base

def self.update_from_feed(url)
  feed = Feedjira::Feed.fetch_and_parse url
    feed.entries.first(30).each do |entry|
      unless exists? guid: entry.id
          create!(
           title:          entry[:title],
           description:    entry[:summary],
           url:            entry[:url],
           published_date: entry[:published],
           guid:           entry[:url],
           price:          entry[:title]
           )
         end
       end
     end


end
