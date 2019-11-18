class Portfolio < ApplicationRecord

    has_many :technologies
    include Placeholder
    validates_presence_of :title, :body, :thumb_image

    def self.angular
        where(subtitle: "angular")
    end

    scope :ruby_on_rails_porfolio_items, -> { where(subtitle: "Ruby on Rails") }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '100', width: '150' )
        self.thumb_image ||= Placeholder.image_generator(height: '200', width: '250' )
    end
end