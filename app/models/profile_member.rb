class ProfileMember < ActiveRecord::Base
  belongs_to :member
  has_one :profile_member
end
