module Commentable
  #Create a new Comment object for each comment in HTML, adding it to the Post object.
  def find_all_comments
    comments_hash = Hash[get_comment_id.zip(get_commentor.zip(get_comment).map{|i| i.include?(',') ? i.split(/,/) : i})]
    push_comments_to_post(comments_hash)
  end


  #Pushes the Comment objects into the Post object's comment array.
  def push_comments_to_post(comments_hash)
    comments_hash.each {|key, value| @post.add_comment(Comment.new(key, value[0], value[1]))}
  end


  #Gets the comment from the given page.
  def get_comment
    @doc.search('.comment > span').map{|ele| ele.inner_text}
  end


  #Gets the commentor from the given page.
  def get_commentor
    @doc.search(':not(.sitebit).comhead > a:first-child').map{|ele| ele.inner_text}
  end


  #Gets the comment ID from the given page.
  def get_comment_id
    @doc.css('.comhead > .age > a:first-child').map{|ele| ele['href']}.map {|x| x[/\d+/]}
  end

end