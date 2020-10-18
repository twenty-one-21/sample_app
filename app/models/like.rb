class Like < ApplicationRecord
    belongs_to :user
    belongs_to :micropost, foreign_key: :post_id

    validates :user_id, presence: true
    validates :post_id, presence: true
end

