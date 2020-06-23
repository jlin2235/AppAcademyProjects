# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


#FIG VAPER
## find_by_credentials
## is_password?
## generate_session_token
## validations
## attr_reader
## password=
## ensure_session_token
## reset_session_token

class User < ApplicationRecord
    validates :email,:session_token, presence: true, uniqueness:true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 8, allow_nil: true} 
    after_initialize :ensure_session_token #after .new call ensure_session_token on the produced object
    attr_reader :password

    def self.find_by_credentials(email,password)
        user = User.find_by(email: email)
        return nil unless user && user.is_password?(password)
        user
    end
    
    def reset_session_token!
        self.session_token = self.class.generate_session_token #generates and change the current session token
        self.save!
        self.session_token #returns it
    end

    def password=(password)
        @password = password # we need this for the validation (password attr_reader returns value of this instance variable)
        self.password_digest = BCrypt::Password.create(password)
        # create: changes plaintext password into a random hash (encrypting)
    end


    def is_password?(password) #plaintext_password
        bc_password = BCrypt::Password.new(self.password_digest) #bcrypt object
        # new: decrypting the password_digest and turning into a BCrypt object
        bc_password.is_password?(password)
        # is_password? belongs to the BCrypt object 
    end


    private
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def self.generate_session_token
        # generates a random string to see if the user's browser session matches the db's session token to see if it's the current user
        SecureRandom::urlsafe_base64
    end

end
