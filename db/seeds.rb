# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..10).each do |n|
  user_params = Hash.new
  user_params[:email] = "#{n}#{FFaker::Internet.email}"
  user_params[:first_name] = FFaker::Name.first_name
  user_params[:last_name] = FFaker::Name.last_name
  user_params[:password]  = "BlahBlah"
  new_user = User.create(user_params)



  (1..10).each do
    new_article = Article.new
    new_article.title = FFaker::HipsterIpsum.words(rand(8)+2).join(" ")
    new_article.content = FFaker::HipsterIpsum.paragraphs(1+ rand(4)).join("\n")
    new_article.save
    new_user.articles.push new_article
  end
end