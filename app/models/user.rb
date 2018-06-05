class User < ApplicationRecord

  include RoleModel

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  roles :admin, :analyst, :asesor, :director

  validates :roles_mask, presence: true
end
