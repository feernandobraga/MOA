
  json.id @event.id
  json.publisher_id @event.member_id
  json.publisher_first_name @event.member.first_name
  json.publisher_last_name @event.member.last_name
  json.title @event.title
  json.address @event.address
  json.meeting_point @event.meeting_point
  json.event_date_and_time @event.time
  json.description @event.description
  json.created_at @event.created_at
  json.attendees @eventAttendance

  #json.call(@eventAttendance, :id)
  #json.attendees_array do
  #  json.array! @eventAttendance do
  #    json.call(:id)
  #  end
  #end

  #json.data do
  #  json.array! @entries do |entry|
  #    json.call(entry, :id, :member_id, :description, :created_at)
  #  end
  #end