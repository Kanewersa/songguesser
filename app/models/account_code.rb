class AccountCode < ApplicationRecord
  belongs_to :user, optional: true

  validates_uniqueness_of :code
end
