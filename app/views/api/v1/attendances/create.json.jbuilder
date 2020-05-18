#event_id: params[:event_id],
#    member_id: params[:member_id],
#
json.id @event.id
json.publisher_id @event.member_id
json.publisher_first_name @event.member.first_name
json.publisher_last_name @event.member.last_name
json.title @event.title
json.address @event.address
json.meeting_point @event.meeting_point
json.event_date_and_time @event.time
json.description @event.description
json.attendees @eventAttendance