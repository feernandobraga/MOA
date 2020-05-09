json.data do
  json.member do
    json.call(
      @member,:email, :access_level, :authorized_for_app, :authentication_token
    )
  end
end