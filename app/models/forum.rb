class Forum < ApplicationRecord
    has_many :posts
    has_many :subscriptions
    has_many :users, through: :subscriptions

    before_destroy :ensure_no_posts

  private

    def ensure_no_posts
        if      posts.exists?
            errors.add(:base, "Cannot delete forum with associated posts")
            throw(:abort) # Prevents the destroy action from proceeding
        end
    end
end
