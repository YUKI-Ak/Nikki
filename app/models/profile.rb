class Profile < ApplicationRecord
  belongs_to :profile

  with_options presence: true do
    validates :about_me
  end

end
