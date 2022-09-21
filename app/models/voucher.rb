class Voucher < ApplicationRecord
  belongs_to :user
  belongs_to :song

  def available?
    used_date.nil?
  end
end
