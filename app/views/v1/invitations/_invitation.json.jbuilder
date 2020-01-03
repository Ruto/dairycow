json.extract! invitation, :id, :username, :phone, :email, :phone_token, :email_token, :dairy_id, :user_id, :invitation_role, :confirmed_by_phone, :phone_confirmed_time, :confirmed_by_email, :email_confirmed_time, :admin_confirmed_at, :admin_confirmed, :admin_confirmed_by, :inviter, :revoked_invite, :created_at, :updated_at
json.url v1_invitation_url(invitation, format: :json)
