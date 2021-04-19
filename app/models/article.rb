class Article < ApplicationRecord

  with_options presence: true do
    validates :title,
               length: { maximum: 50 }
    validates :content
  end
end
