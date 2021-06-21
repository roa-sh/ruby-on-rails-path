module ArticlesHelper
   def get_author(user_id)
    User.find(user_id)
  end
end
