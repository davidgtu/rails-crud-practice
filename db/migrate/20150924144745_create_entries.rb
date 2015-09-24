class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name, null: false
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
