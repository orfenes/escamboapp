class Admin < ActiveRecord::Base

  enum role: [:full_access, :restricted_access]

  # lambda para exibir somente admins com permissao full_access
  scope :with_full_access, -> { where(role: 'full_access') }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
