class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :identities
  validates_presence_of :email

  def self.create_with_omniauth(auth)
    user = find_by(email: auth.info.email)
    if !user.nil?
      user
    else
      create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        # assuming the user model has a name
        user.name = auth.info.name
        user.image = auth.info.image
        # user.image = auth.info.image # assuming the user model has an image
        user.type = 'Voter'
      end
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes'] && session['devise.identity_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
end
