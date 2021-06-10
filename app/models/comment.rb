class Comment < ApplicationRecord
  includes Visible
  belongs_to :article
end
