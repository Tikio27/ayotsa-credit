class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.belongs_to :client, foreign_key: true
      t.decimal :credit_requested, precision: 10, scale: 2
      t.string :frequency
      t.integer :term
      t.decimal :monthly_interest_rate, precision: 8, scale: 2
      t.string :status
      t.decimal :annual_interest_rate, precision: 8, scale: 2
      t.integer :payments_number
      t.decimal :insurance, precision: 8, scale: 2
      t.decimal :payment_without_insurance, precision: 8, scale: 2
      t.decimal :total_payment, precision: 8, scale: 2
      t.decimal :interest_rate_to_payment, precision: 8, scale: 2
      t.text :analyst_comment
      t.text :additional_comment
      t.integer :analyst_id
      t.text :observations_and_conditions
      t.date :approved_at
      t.date :completed_at
      t.date :cancelled_at

      t.timestamps
    end
  end
end
