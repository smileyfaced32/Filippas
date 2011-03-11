class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :omniauthable, :registerable, :recoverable,
   :rememberable, :trackable, :validatable, :token_authenticatable

   field :name
   field :newsletter
   field :email, :default => "", :null => false
   field :phone_number
   field :encrypted_password, :limit => 128, :default => "", :null => false
   field :password_salt, :default => "", :null => false
   field :reset_password_token
   field :remember_token
   field :remember_created_at, :type => DateTime
   field :sign_in_count, :type => Integer, :default => 0
   field :current_sign_in_at, :type => DateTime
   field :last_sign_in_at, :type => DateTime
   field :current_sign_in_ip
   field :last_sign_in_ip 
   field :facebook_uid
   field :facebook_token
   field :admin, :type => Boolean, :default => false
   field :location_name
   field :location_id
   field :birthday, :type => DateTime
   field :gender
   field :role

  ROLES = %w[admin user]
  NEWSLETTER = %w[Subscriber Non-Subscriber]
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password. 
      User.create!( 
        :email => data['email'], 
        :name => data['name'], 
        :facebook_uid => fb_data['uid'], 
        :facebook_token => fb_data['credentials']['token'],
        :location_name => data['location']['name'],
        :location_id => data['location']['id'],
        :birthday => data['birthday'].present? ? Date.parse(data['birthday']) : nil,
        :gender => data['gender'],
        :password => Devise.friendly_token[0,20]
        ) 
    end
  end
  
  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
          user.email = data["email"]
        end
      end
    end
  
  
end


  