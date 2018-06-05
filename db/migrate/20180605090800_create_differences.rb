class CreateDifferences < ActiveRecord::Migration[5.1]
  def change
    create_table :differences do |t|
      t.belongs_to :client, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
