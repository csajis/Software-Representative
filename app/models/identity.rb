class Identity < ApplicationRecord
  belongs_to :user

  def self.find_or_create_with_omniauth(auth)
    find_or_create_by(uid: auth['uid'], provider: auth['provider'])
  end
end
