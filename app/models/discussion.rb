class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  belongs_to :user
end
