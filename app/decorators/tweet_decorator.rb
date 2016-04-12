class TweetDecorator < Draper::Decorator
  delegate_all

 def body
    object.body.gsub(/#\w+/) do |tag|
      h.link_to(tag, h.search_path(tag[1..-1]))
  end.html_safe
 end

end
