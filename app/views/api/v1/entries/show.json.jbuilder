#json.call(@entry,  :id, :member_id, :title, :description, :created_at)

#create_table "entries", force: :cascade do |t|
#  t.integer "member_id", null: false
#  t.string "title"
#  t.text "description"
#  t.datetime "created_at", precision: 6, null: false
#  t.datetime "updated_at", precision: 6, null: false
#  t.index ["member_id"], name: "index_entries_on_member_id"
#end
#
#json.extract! @entry, :id, :member_id, :title, :description, :created_at

#json.news do
#  json.id @entry.id
#  json.publisher_id @entry.member_id
#  json.publisher_first_name @entry.member.first_name
#  json.publisher_last_name @entry.member.last_name
#  json.title @entry.title
#  json.description @entry.description
#  json.created_at @entry.created_at
#end

  json.id @entry.id
  json.publisher_id @entry.member_id
  json.publisher_first_name @entry.member.first_name
  json.publisher_last_name @entry.member.last_name
  json.title @entry.title
  json.description @entry.description
  json.created_at @entry.created_at


#json.publisher do
#  json.id @entry.member.id
#  json.first_name @entry.member.first_name
#  json.last_name @entry.member.last_name
#end


#
#json.posts(@entry.member) do |author|
#  json.call(author, :first_name)
#end