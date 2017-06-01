require 'random_data'

#Create Posts
50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all

#Create Comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

Post.find_or_create_by(
    title: "This is Tyler's Title",
    body: "This is Tyler's Body"
)

Comment.find_or_create_by(
    post: Post.find_or_create_by(title: "This is Tyler's Title"),
    body: "Unique body for Tyler's Post"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"