class Client < ApplicationRecord

  has_many :credits

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :date_of_birth, presence: true

  scope :ordered_by_name, -> { order(:name) }
  scope :search_by_name, ->(name) { where('unaccent(clients.name)ILIKE unaccent(?)', "%#{name}%") }

  def to_s
    name
  end

  def self.ransackable_scopes(_auth_object = nil)
    [:search_by_name]
  end

end
