class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :thumb_image

    def self.angular
        where(subtitle: "angular")
    end

    scope :ruby_on_rails_porfolio_items, -> { where(subtitle: "Ruby on Rails") }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= "https://via.placeholder.com/150"
        self.thumb_image ||= "https://via.placeholder.com/150x200"
    end
end