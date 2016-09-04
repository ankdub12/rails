class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :transaction_amount
      t.references :user, index: true
      t.references :borrower, index: true

      t.timestamps
    end
  end
end
