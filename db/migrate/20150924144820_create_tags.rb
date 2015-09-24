class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :body
    end
  end
end
