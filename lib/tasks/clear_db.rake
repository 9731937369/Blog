task :clear_db => :environment do 
	Category.delete_all
	Article.delete_all
end