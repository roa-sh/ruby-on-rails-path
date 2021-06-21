module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: {in: VALID_STATUSES}
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end

    def self_articles_count(user_id)
      where(user_id: user_id).count
    end
  end

  def archived?
    status == 'archived'
  end
end