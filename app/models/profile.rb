class Profile < ApplicationRecord

  with_options presence: true do
    validates :about_me,
    length: { minimum: 10}
  end

  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sns
end
