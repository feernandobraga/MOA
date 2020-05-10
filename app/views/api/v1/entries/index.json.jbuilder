#json.data do
#  json.array! @entries do |entry|
#    json.call(entry, :id, :member_id, :description, :created_at)
#  end
#end

#json.posts(@entries.member) do |author|
#  json.call(author,  :first_name)
#end

#
#json.authors(entry.members) do |author|
#  json.url author_url(author, format: :json)
#end

 #
 #json.array! @entries


#json.array! @entries, as: :entry
#json.extract! entry, :id
#


json.array! @entries do |entry|
    json.id entry.id
    json.publisher_id entry.member_id
    json.publisher_first_name entry.member.first_name
    json.publisher_last_name entry.member.last_name
    json.title entry.title
    json.description entry.description
    json.created_at entry.created_at
end