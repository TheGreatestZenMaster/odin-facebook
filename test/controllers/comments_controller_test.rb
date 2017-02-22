require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:jake)
        @post = posts(:first)
    end
  
    test "comment should not save without content" do
        comment = Comment.create(post: @post, author: @user)
        assert_not comment.save
    end
end
