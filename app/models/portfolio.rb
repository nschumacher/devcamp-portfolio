class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :thumb_image

    def self.angular
        where(subtitle: "angular")
    end

    scope :ruby_on_rails_porfolio_items, -> { where(subtitle: "Ruby on Rails") }
end
