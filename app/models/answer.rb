class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :song
end
