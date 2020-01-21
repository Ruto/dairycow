json.user do
  json.call(
    @user,
    :email,
    :username,
    :phone,
    :phone_confirmed,
    :email_confirmed,
    :confirmed_at,
    :confirmation_time_at
  )
  json.token token
end
