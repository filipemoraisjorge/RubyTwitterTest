class SearchController < ApplicationController

def search
  @hashtag = Hashtag.find_by(tag: params[:hashtag])
  @tweets = @hashtag.tweets.decorate
end
end
