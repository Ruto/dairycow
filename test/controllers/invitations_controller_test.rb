require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invitation = invitations(:one)
  end

  test "should get index" do
    get invitations_url, as: :json
    assert_response :success
  end

  test "should create invitation" do
    assert_difference('Invitation.count') do
      post invitations_url, params: { invitation: { admin_confirmed: @invitation.admin_confirmed, admin_confirmed_at: @invitation.admin_confirmed_at, admin_confirmed_by: @invitation.admin_confirmed_by, confirmed_by_email: @invitation.confirmed_by_email, confirmed_by_phone: @invitation.confirmed_by_phone, dairy_id: @invitation.dairy_id, email: @invitation.email, email_confirmed_time: @invitation.email_confirmed_time, email_token: @invitation.email_token, invitation_role: @invitation.invitation_role, inviter: @invitation.inviter, phone: @invitation.phone, phone_confirmed_time: @invitation.phone_confirmed_time, phone_token: @invitation.phone_token, revoked_invite: @invitation.revoked_invite, user_id: @invitation.user_id, username: @invitation.username } }, as: :json
    end

    assert_response 201
  end

  test "should show invitation" do
    get invitation_url(@invitation), as: :json
    assert_response :success
  end

  test "should update invitation" do
    patch invitation_url(@invitation), params: { invitation: { admin_confirmed: @invitation.admin_confirmed, admin_confirmed_at: @invitation.admin_confirmed_at, admin_confirmed_by: @invitation.admin_confirmed_by, confirmed_by_email: @invitation.confirmed_by_email, confirmed_by_phone: @invitation.confirmed_by_phone, dairy_id: @invitation.dairy_id, email: @invitation.email, email_confirmed_time: @invitation.email_confirmed_time, email_token: @invitation.email_token, invitation_role: @invitation.invitation_role, inviter: @invitation.inviter, phone: @invitation.phone, phone_confirmed_time: @invitation.phone_confirmed_time, phone_token: @invitation.phone_token, revoked_invite: @invitation.revoked_invite, user_id: @invitation.user_id, username: @invitation.username } }, as: :json
    assert_response 200
  end

  test "should destroy invitation" do
    assert_difference('Invitation.count', -1) do
      delete invitation_url(@invitation), as: :json
    end

    assert_response 204
  end
end
