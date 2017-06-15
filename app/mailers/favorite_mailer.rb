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
end
