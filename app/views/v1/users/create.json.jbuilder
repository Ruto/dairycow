json.user do
  json.call(
    @user,
    :email,
    :username,
    :phone,
    :phone_confirmed,
    :email_confirmed,
    :confirmation_sent_at
  )
  json.token token
end
