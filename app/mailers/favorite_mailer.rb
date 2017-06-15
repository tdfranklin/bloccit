class FavoriteMailer < ApplicationMailer

    default from: "tdfranklin0184@gmail.com"

    def new_comment(user, post, comment)

        headers["Message-ID"] = "<comments/#{comment.id}@whispering-wildwood-85624.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@whispering-wildwood-85624.example>"
        headers["References"] = "<post/#{post.id}@whispering-wildwood-85624.example>"

        @user = user
        @post = post
        @comment = comment

        mail(to: user.email, subject: "New comment on #{post.title}")
    end

    def new_post(post)

        headers["Message-ID"] = "<posts/#{post.id}@whispering-wildwood-85624.example>"        
        headers["In-Reply-To"] = "<post/#{post.id}@whispering-wildwood-85624.example>"
        headers["References"] = "<post/#{post.id}@whispering-wildwood-85624.example>"

        @post = post

        mail(to: post.user.email, subject: "You are subscribed to #{post.title}")
    end
end