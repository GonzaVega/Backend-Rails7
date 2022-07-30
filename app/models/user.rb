class User < ApplicationRecord
    before_save {self.email = email.downcase}
    belongs_to :conference, optional: true
    has_many :as_speaker_conferences, dependent: :destroy, class_name: "Conference"
    has_and_belongs_to_many :conferences
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX} 
    has_secure_password
end
