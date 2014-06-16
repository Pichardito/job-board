class User < ActiveRecord::Base
  require 'digest/sha1'
  include ActiveModel::Validations
  authenticates_with_sorcery!
  has_many :prospect_cards
  has_many :prospect_card_likes
  has_many :recruiter_cards
  has_many :recruiter_card_likes

validates :email, uniqueness: true, presence: true,  email: true
validates :password, length: {within: 5..40, too_short: "Passwords must be 5 characters or longer", too_long: "That password is too long. Please try one under 25 characters."}

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.now + auth.extra.access_token.params[:oauth_expires_in].to_i
      user.linkedin_email = auth.info['email']
      user.linkedin_profile_img = auth.info['image']
      #POSSIBLE DUMMY VARIABLES TO FORCE PASS VALIDATION
      #PLACEHOLDER PASSWORD TO PASS VALIDATIONS
      rand_string = (0...8).map { (65 + rand(26)).chr }.join
      user.password = Digest::SHA1.hexdigest rand_string
      user.email = auth.info['email']
      user.save!
    end
  end

  def test_to_s
    "Hi my name is #{self.name} and my email is #{self.email}"
  end

end
