class Survey
    include Mongoid::Document
    
    field :first_name
    field :last_name
    field :email
    field :address
    field :city
    field :state
    field :country_name
    field :birthday_month
    field :birthday_day
    field :birthday_year
    field :anniversary_month
    field :anniversary_day
    field :anniversary_year
    field :visit_month
    field :visit_day
    field :visit_year
    field :time_of_day
    field :check_number
    field :server_name
    field :what_brought_you_to_restaurant
    field :visit_special_occasion
    field :experience_greeting
    field :experience_table
    field :experience_temperature
    field :experience_noiselevel
    field :experience_timing
    field :experience_valued
    field :experience_serverknowledge
    field :experience_dessert
    field :meal_timing
    field :meal_temperature
    field :meal_appearance
    field :overall_dining_experience
    field :cleanliness
    field :quality_atmosphere
    field :cost_value
    field :menu_selections
    field :special_occurrence
    field :menu_addition
    
    
    validates :email, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
    validates :check_number, :presence => true, :uniqueness => true , :length => { :minimum => 5 }
    validates :first_name, :presence => true , :length => { :maximum => 100 }
    validates :last_name, :presence => true, :length => { :maximum => 100 }
    validates :city, :presence => true , :length => { :maximum => 100 }
    validates :birthday_month, :presence => true 
    validates :birthday_day, :presence => true
    validates :visit_month, :presence => true
    validates :visit_day, :presence => true
    validates :time_of_day, :presence => true
    validates :server_name, :presence => true, :length => { :maximum => 100 }
    validates :overall_dining_experience, :presence => true
    validates :cleanliness, :presence => true
    validates :quality_atmosphere, :presence => true
    validates :cost_value, :presence => true
    validates :menu_selections, :presence => true
    validates :what_brought_you_to_restaurant, :presence => true
    validates :experience_greeting, :presence => true
    validates :experience_timing, :presence => true
    validates :meal_timing, :presence => true
end
