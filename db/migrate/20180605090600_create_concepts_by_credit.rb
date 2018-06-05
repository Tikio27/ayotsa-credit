class CreateConceptsByCredit < ActiveRecord::Migration[5.1]
  def change
    create_table :concepts_by_credit do |t|
      t.belongs_to :credit, foreign_key: true
      t.belongs_to :client, foreign_key: true
      t.belongs_to :concept, foreign_key: true
      t.integer :latest_receipt
      t.integer :previous_receipt
      t.integer :total

      t.timestamps
    end
  end
end
