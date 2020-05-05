class Event < ApplicationRecord
  belongs_to :member
  has_many :attendances,  dependent: :destroy

  def current_id
    # this method is called from the members#display_pending and returns:
    #   * true - if a there is no more pending requests
    #   * false - if there are requests to be displayed
    Event.find(params[:id])

  end
end
