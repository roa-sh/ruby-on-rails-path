class Comment < ApplicationRecord
  includes Visible
  belongs_to :article
  belongs_to :user
end
