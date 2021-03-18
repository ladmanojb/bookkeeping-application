class Contact < ApplicationRecord
	has_many :transactions

	def self.get_contacts
		@contacts = self.all
    @contactsHash = {}
    @contacts.each{|key, value| @contactsHash[key[:name]] = key[:id]}
    return @contactsHash
	end
end
