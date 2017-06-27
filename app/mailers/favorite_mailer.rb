class FavoriteMailer < ApplicationMailer

    default from: "tdfranklin0184@gmail.com"

    def new_comment(user, post, comment)

        headers["Message-ID"] = "<comments/#{comment.id}@bloccit-tdf.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@bloccit-tdf.example>"
        headers["References"] = "<post/#{post.id}@bloccit-tdf.example>"

        @user = user
        @post = post
        @comment = comment

        mail(to: user.email, subject: "New comment on #{post.title}")
    end
end
