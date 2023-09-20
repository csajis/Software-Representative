class Vote < ApplicationRecord
  belongs_to :voter
  belongs_to :votation
  belongs_to :votation_option

end
