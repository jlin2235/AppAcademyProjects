class User < ApplicationRecord
    attr_reader :password 

    validates :user_name, presence: true, uniqueness: true 
    validates :password_digest, presence: true

    after_initialize :ensure_session_token 

    def reset_session_token! #'!' indicates that we touch the database
        self.session_token = self.class.generate_session_token #session_token is reader/write method from migration table 
        self.save! 
        self.session_token #getter method automatic from migration(rails magic)
    end

    
    def password=(password) #setter for password_digest since its not one of the column, rails will automatically set the params
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end
    
    def is_password?(password)
        # self.password_digest == BCrypt::Password.new(password)
        bc_password = BCrypt::Password.new(self.password_digest)
        bc_password.is_password?(password)
    end
    
    def self.find_by_credentials(username, password)
        user = User.find_by(user_name: username)
        
        unless user && user.is_password?(password) 
            return nil
        end
        
        user
        
    end
    
    private

    def self.generate_session_token
        SecureRandom::urlsafe_base64 #this will generate a random string 
    end
    
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
    
end
