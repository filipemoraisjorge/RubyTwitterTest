class Tweet < ActiveRecord::Base

belongs_to :user
has_and_belongs_to_many :hashtags

validates :body, presence: true, length: { maximum: 140 }

default_scope -> { order(created_at: :desc)}

before_save :set_hashtags

private
def set_hashtags
  tags = body.scan /#\w+/
  self.hashtags = tags.map do |tag|
    Hashtag.find_or_create_by(tag: tag[1..-1])
  end
end


end
