class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :tag
    end
    create_table :hashtags_tweets do |t|
      t.references :hashtag
      t.references :tweet
    end
  end
end
