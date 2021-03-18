class AddContactIdToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :contact_id, :integer
    add_index :transactions, :contact_id
  end
end
