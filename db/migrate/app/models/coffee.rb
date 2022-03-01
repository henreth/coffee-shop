class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers through: :orders

    def unique_customer_names 
        self.customers.map{|customer|customer.name}.uniq
    end

    def self.most_ordered
        # self.all.orders.map{|order|order.coffee.title}.tally.max

        all.max_by{|coffee| coffee.orders.length}
        all.includes(|:orders|).max_by{|coffee| coffee.orders.length}
    end


end