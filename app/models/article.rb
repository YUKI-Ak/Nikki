class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :title,
               length: { maximum: 50 }
    validates :content
  end
end

