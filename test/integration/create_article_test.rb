require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
    def setup
        @user = User.create(username: "avon", email: "avon@gmail.com", password: "avon", admin: true)
    end
    test "create new article" do
        sign_in_as(@user, "avon")
        get new_article_path
        assert_template 'articles/new'
        assert_difference 'Article.count', 1 do
            post_via_redirect articles_path, article: {title: "New", description: "Test article description", user:@user}
        end 
        assert_template 'articles/show'
        assert_match "New", response.body
    end
end

