class Hashtag < ActiveRecord::Base
	include SimpleHashtag::Hashtaggable
	Hashtaggable_attribute :caption
  has_and_belongs_to_many :bookmarks 	
end
