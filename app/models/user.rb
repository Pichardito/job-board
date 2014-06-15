class User < ActiveRecord::Base
  require 'digest/sha1'
  authenticates_with_sorcery!
  has_many :prospect_cards
  has_many :recruiter_cards

  #COMMENTED OUT BECAUSE THEY CONFLICT WITH LINKEDIN OAUTH

  # validates_presence_of :password, on: :create
  # validates_presence_of :email, on: :create
  # validates_uniqueness_of :email

  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      binding.pry
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
      #user.email = 'auth.info['email']
      user.save!
    end
  end

  def test_to_s
    "Hi my name is #{self.name} and my email is #{self.email}"
  end

end
