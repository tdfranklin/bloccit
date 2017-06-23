module UsersHelper

    def user_post_count
        @user.posts.count > 0
    end
end
