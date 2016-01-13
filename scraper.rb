require 'csv'

require_relative 'comment'
require_relative 'post'
require_relative 'commentable'

class Scraper

  extend Commentable

  class << self
    
    #Creates a Post object.
    def get_post_info(url)

      #Get the HTML using nokogiri.
      @doc = Nokogiri::HTML(open(url).read, nil, 'utf-8')

      #Instantiates the Post object.
      @post = Post.new(get_title, url, get_points, get_item_id)
      find_all_comments

      #Return the Post object.
      @post
    end


    #Gets the page title.
    def get_title
      @doc.css('title').text
    end


    #Gets the post points.
    def get_points
      @doc.css('.score').text
    end


    #Gets the post item ID.
    def get_item_id
      @doc.css('.subtext > .age > a:first-child').map{|ele| ele['href']}.map {|x| x[/\d+/]}.join
    end
  end
end
