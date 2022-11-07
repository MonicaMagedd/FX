class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.uuid :customer_id
      t.integer :input_amount
      t.string :input_currency
      t.integer :output_amount
      t.string :output_currency

      t.timestamps
    end
  end
end
