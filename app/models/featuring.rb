class Featuring < ActiveRecord::Base
  
  belongs_to :listing
  belongs_to :feature
end
