['funny', 'politics', 'internation', 'sports', 'videos'].each do |category|
  Category.create(name: category)
end
20.times do
  Category.all.each do |category|
    post = category.posts.create(title: Faker::Lorem.sentence)
    5.times do
      post.comments.create(author: Faker::Lorem.words(1)[0], text: Faker::Lorem.paragraph)
    end
  end
end

puts 'data has been seeded'
