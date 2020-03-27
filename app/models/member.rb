class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :attendances

  def self.is_pending_empty?
    # this method is called from the members#display_pending and returns:
    #   * true - if a there is no more pending requests
    #   * false - if there are requests to be displayed
    where(authorized_for_app: false).blank?
  end


end
