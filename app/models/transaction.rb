class Transaction < ApplicationRecord
	belongs_to :contact, optional: true
end
