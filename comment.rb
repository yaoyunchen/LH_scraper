class Comment

  attr_reader :comment_id

  attr_accessor :comment, :commentor

  def initialize(comment_id, commentor, comment)
    @comment_id = comment_id.red
    @commentor = commentor.blue
    @comment = comment.green
  end

  def display_comment_info
    "comment #{comment_id} by #{commentor}\n--------------------------------------\n#{comment}"
  end

end