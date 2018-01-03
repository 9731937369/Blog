class Category < ActiveRecord::Base
	has_many :articles
	validates_presence_of :name, :description
	validates_length_of :name, minimum: 5
	validates_length_of :description, within: 5..200
	validates_uniqueness_of :name

	extend FriendlyId
  	friendly_id :name, use: :slugged

end
