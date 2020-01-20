json.user do
  json.call(
    @user,
    :email,
    :username,
    :phone,
    :confirmed_at,
    :confirmation_time_at
  )
  json.token token
end
