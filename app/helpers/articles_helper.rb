module ArticlesHelper
  def get_author(user_id)
    User.find(user_id)
  end

  def following?(author)
    following = Follower.where(user_id: current_user.id).to_a
    following = following.map { |f| f.following }
    puts "Following to: #{following}, Author:#{author}"
    following.include?(author)
  end
end
