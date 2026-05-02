class Prescription < ApplicationRecord
  belongs_to :topic

  validates :user_input, presence: true
end
