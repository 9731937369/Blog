class Article < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :category
	validates_presence_of :title, :body, :category_id, :feature_image_url
	validates_numericality_of :category_id, greater_than:0
	validates_length_of :title, minimum: 5
	validates_length_of :body, within: 5..1150
	validates_uniqueness_of :title
	validate :check_is_publishing, :check_is_published

	extend FriendlyId
  	friendly_id :title, use: :slugged

	private

	def check_is_publishing
		if self.publish_date > Date.today + 1.month
			self.errors.add(:publish_date, "cannot be greater than 1 month")
		end
	end
	def check_is_published
		if self.publish_date > Date.today - 1.day && self.is_published
			self.errors.add(:is_published, "It is not published")
		end
	end

end


