class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :attendances
  has_many :entries

  def self.is_pending_empty?
    # this method is called from the members#display_pending and returns:
    #   * true - if a there is no more pending requests
    #   * false - if there are requests to be displayed
    where(authorized_for_app: false).blank?
  end
def self.search(param)
  param.strip!
  to_send_back = (first_name_matches(param) + last_name_matches(param)).uniq
  return nil unless to_send_back
  to_send_back 
end
def self.first_name_matches(param)
  matches('first_name', param)
end
def self.last_name_matches(param)
  matches('last_name', param)

end
def self.matches (field_name, param )
  where("#{field_name} like ?", "%#{param}%")
end


end
