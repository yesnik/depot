class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :number
      t.decimal :balance, precision: 10, scale: 2

      t.timestamps
    end
  end
end
