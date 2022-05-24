# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do |number|
  a = Article.create(title: "#{number}article", body: "#{number}" * 20, status: Article::VALID_STATUSES.sample)
  a.comments.create(commenter: "#{number}" * 3, body: "#{number}" * 30, status: Article::VALID_STATUSES.sample)
  a.comments.create(commenter: "#{number}" * 5, body: "#{number}" * 50, status: Article::VALID_STATUSES.sample)
end
