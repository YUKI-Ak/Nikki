class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :title,
               length: { maximum: 50 }
    validates :content
  end
end

