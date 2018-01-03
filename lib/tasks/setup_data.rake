task :setup_data => :environment do 
	5.times do 
		Category.create(name: Faker::Commerce.department(1))
	end
	20.times do 
		Article.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, category_id: Category.all.sample.id, publish_date: Faker::Date.between(Date.today.beginning_of_year, Date.today), feature_image_url:Faker::LoremPixel.image("940x350", false, 'sports'), user_id: User.all.sample.id)
	end
end