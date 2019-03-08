class Post < ApplicationRecord
  belongs_to :user

  def can_edit(post_id, current_user_id)
    @post = Post.find(post_id)
    posted_at = @post.created_at
    editable = (Time.now - posted_at) > 600 ? false : true
    editable ? @post.user_id == current_user_id ? true : false : false
  end

  def verbose_timestamp(datetime)
    elapsed_time = Time.now.to_i - datetime.to_i
    case
    when elapsed_time < 60
      return "Just now"
    when elapsed_time < 3_600
      hrs = elapsed_time / 60
      message = hrs.to_s + " minute#{elapsed_time < 2 ? "" : "s"}  ago"
      return message
    when elapsed_time < 86_400
      elapsed_time /= 3_600
      message = elapsed_time.to_s + " hour#{elapsed_time < 2 ? "" : "s"}  ago"
      return message
    when elapsed_time < 610_800
      elapsed_time /= 86_400
      message = elapsed_time.to_s + " day#{elapsed_time < 2 ? "" : "s"} ago"
      return message
    else
      message = "on " + (datetime.strftime("%b %d %Y")).to_s
      return message
    end
  end

end
