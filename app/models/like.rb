class Like < ApplicationRecord
  belongs_to :apple
  belongs_to :user

  validates_uniqueness_of :apple_id, scope: :user_id

end
