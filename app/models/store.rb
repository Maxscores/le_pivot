class Store < ApplicationRecord
  has_many :items
  has_many :user_stores
  has_many :store_orders
  has_many :users, through: :user_stores
  validates :name, uniqueness: true
  validates_presence_of :status, :name, :address
  before_save :set_slug

  scope :active_stores, -> { where(status: "active")}
  scope :pending_stores, -> { where(status: "pending")}
  scope :suspended_stores, -> { where(status: "suspended")}

  def set_slug
    self.slug = name.parameterize
  end

  def suspended?
    return true if self.status == "suspended"
  end

  def active_items
    items.where(condition: 'active')
  end

  def user_type(user)
    user_stores.find_by(user_id: user).user_type
  end

  def tweet(text)
    TwitterService.new(twitter_token, twitter_secret).tweet(text)
  end
end
