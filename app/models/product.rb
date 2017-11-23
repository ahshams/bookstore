class Product < ApplicationRecord
  validates :title, presence: true, uniqueness: true,
             length: {minimum: 10, maximum: 30}
            #validates_length_of :title, :minimum => 10
  validates :description, presence: true,
             length: {minimum: 3, maximum: 1000}
            #too_long: "%{count} characters is the maximum allowed"}
  validates :image_url, presence: true, allow_blank: false,
            :format => {with: %r{\.(gif|jpg|png|)$\Z}i,
            message: 'must be a URL for GIF, JPG or PNG image'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :book_number, allow_blank: true, uniqueness: true

  has_many :line_items
  has_many :orders, through: :line_items, source: :order

  before_destroy :ensure_not_referenced_by_any_line_item

  #...

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
