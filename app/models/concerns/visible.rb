module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  VALID_STATUSES.each do |valid_status|
    define_method "#{valid_status}?" do
      status == valid_status
    end
  end
end
