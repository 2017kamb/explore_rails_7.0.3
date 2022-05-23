class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  VALID_STATUSES.each do |valid_status|
    define_method "#{valid_status}?" do
      status == valid_status
    end
  end
end
