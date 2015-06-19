class User < ActiveRecord::Base
	has_secure_password
	
	has_many :articles


	validates :email,
			  :uniqueness => true,
		      :format => { with: /.+@.+/ },
		      :presence => true

    validates :first_name,
    		  :presence => true,
    		  :format => { with: /\A[a-zA-Z0-9]+\z/ }

    validates :last_name,
    		  :presence => true,
    		  :format => { with: /\A[a-zA-Z0-9]+\z/ }

    validates :password,
    		  :presence => true,
    		  :length => { :minimum => 7},
    		  :length => { :maximum => 20}



	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
