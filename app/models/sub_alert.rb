class SubAlert < ApplicationRecord
  belongs_to :notification
  belongs_to :subscription
end
