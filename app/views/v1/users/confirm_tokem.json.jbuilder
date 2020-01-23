json.user do
  json.call(
    @user,
    :phone_confirmed,
    :email_confirmed,
    :confirmation_sent_at,
    :user_confirmed
  )
end
