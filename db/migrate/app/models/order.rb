class Orders < ActiveRecord::Base
    belongs_to :coffee
    belongs_to :customer

    def receipt
        puts "#{customer.name} ordered #{self.coffee.title} for #{self.price} "
    end

    def self.most_expensive
        all.max_by{|order|order.price}[0]
    end

end