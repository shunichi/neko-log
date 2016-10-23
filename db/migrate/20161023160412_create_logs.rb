class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :cat, foreign_key: true, index: true
      t.decimal :weight, precision: 4, scale: 2

      t.timestamps
    end
  end
end
