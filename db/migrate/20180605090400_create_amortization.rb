class CreateAmortization < ActiveRecord::Migration[5.1]
  def change
    create_table :amortization do |t|
      t.belongs_to :client, foreign_key: true
      t.belongs_to :credit, foreign_key: true
      t.integer :payment_number
      t.decimal :capital, precision: 8, scale: 2
      t.decimal :interest, precision: 8, scale: 2
      t.decimal :insurance, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.decimal :remainder, precision: 8, scale: 2

      t.timestamps
    end
  end
end
