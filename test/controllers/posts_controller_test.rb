require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:jake)
    end
  
    test "Post should not save without content" do
        user_post = @user.posts.create
        assert_not user_post.save
    end
end

