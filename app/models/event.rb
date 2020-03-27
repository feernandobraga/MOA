class Event < ApplicationRecord
  belongs_to :member
  has_many :attendances

end
