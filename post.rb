class Post

  attr_reader :title, :url, :points, :item_id
  attr_accessor :comment_array

  def initialize(title, url, points, item_id)
    # title on webpage
    @title = title.green
    # post URL
    @url = url.light_red
    # post points
    @points = points.blue
    # post's item ID
    @item_id = item_id.red
    # comments related to the post
    @comment_array = [] 
  end
  

  #Takes Comment object as input and adds to comment list.
  def add_comment(comment)
    comment_array << comment
  end


  #Returns the post information.
  def show_info
     "
      Title:    #{title}
      URL:      #{url}
      points:   #{points}
      item ID:  #{item_id}
      "
  end


  #Returns all comments.
  def comments
    ret_str = ""
    comment_array.each {|ele| ret_str << ele.display_comment_info}
    ret_str
  end
end