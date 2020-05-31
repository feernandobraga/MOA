#json.array! @events,  :id, :title, :description
# json.array! @events
#

#json.data do
#  json.array! @events do |event|
#    json.call(event, :id, :member_id, :title, :address, :meeting_point, :time, :description, :created_at)
#  end
#end

json.array! @events do |event|
  json.id event.id
  json.publisher_id event.member_id
  json.publisher_first_name event.member.first_name
  json.publisher_last_name event.member.last_name
  json.title event.title
  json.address event.address
  json.meeting_point event.meeting_point
  json.event_date_and_time event.time
  json.description event.description
  json.created_at event.created_at
  json.attendees event.attendances

end

#[
#        {
#            "id": 1,
#            "member_id": 6,
#            "title": "My Birthday",
#            "address": "15/2 Arthur Street, Preston",
#            "meeting_point": "Carpark",
#            "time": "2020-03-25T20:30:00.000Z",
#            "description": "It's gonna be a BLAST!\r\nYou cannot miss it (:",
#            "created_at": "2020-03-24T14:10:13.373Z"
#        },