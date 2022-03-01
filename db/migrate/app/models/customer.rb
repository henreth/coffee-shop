class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders,

    def self.names
        self.all.map{|customer|customer.name}
        # pluck(:name)
    end

    def order_coffee (title,price)
        new_order = Order.create(price: price)
        self.orders << new_order
        coffee =Coffee.all.find{|drink| drink.title ==title}
        coffee.orders << new_order

        put new_order.receipt

        # coffee = Coffee.find_by(title: coffee_title)
        # Order.create(customer: self, coffee: coffee, price: price)
    end

    def total_purchases_amount
        self.orders.map{|orders| order.price}.sum

        # orders.sum(:price)
    end

    def dislike_coffee title
        last_order= self.orders.find{|order| order.coffee.title == title}
        puts "#{self.name} has been refunded #{last_order.price}"
        Order.delete(last_order.id)

        # coffee = Coffee.find_by(title: coffee_title)
        # order = orders.find_by(coffee_id: coffee.id)
        # order.destroy

        # puts "#{name} has been refunded $#{order.price}"
    end

end