require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
    test "user successfully signed up" do
        get signup_path
        assert_template 'users/_form'
        assert_difference 'User.count', 1 do
            post_via_redirect users_path, user: {username: "joe", email: "joe@gmail.com", password: "joe"}
        end
        assert_template 'users/show'
        assert_match "joe", response.body
    end
end

