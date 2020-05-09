#json.array! @events,  :id, :title, :description
# json.array! @events
#

json.data do
  json.array! @events do |event|
    json.call(event, :id, :member_id, :title, :address, :meeting_point, :time, :description, :created_at)
  end
end
