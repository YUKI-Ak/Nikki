class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :momment, presence :true, length (:maximum :200 )
end
