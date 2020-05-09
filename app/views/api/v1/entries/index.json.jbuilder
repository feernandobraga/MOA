#json.data do
#  json.array! @entries do |entry|
#    json.call(entry, :id, :member_id, :title, :address, :meeting_point, :time, :description, :created_at)
#  end
#end
#
 json.array! @entries