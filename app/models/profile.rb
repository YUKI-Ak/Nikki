class Profile < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :about_me,
               length: { minimum: 10}
  end

end
