#{
#    "status": "created",
#    "member": {
#        "id": 13,
#        "email": "apiuser2@moa.com",
#        "membership_number": "999",
#        "first_name": "API",
#        "last_name": "USER",
#        "authorized_for_app": false,
#        "created_at": "2020-05-13T19:09:15.972+10:00",
#        "updated_at": "2020-05-13T19:09:15.972+10:00",
#        "access_level": null,
#        "authentication_token": "GiBf-ReTXsLzxByEdrzs"
#    }
#}
#

json.id @member.id
json.email @member.email
json.membership_number @member.membership_number
json.first_name @member.first_name
json.last_name @member.last_name
json.authorized_for_app @member.authorized_for_app
#json.access_level @member.access_level
json.authentication_token @member.authentication_token