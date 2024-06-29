class CreateApples < ActiveRecord::Migration[6.1]
  def change
    create_table :apples do |t|
      t.string :name
      t.string :relation
      t.string :kind
      t.text :about
      t.integer :iidd

      t.timestamps
    end
  end
end
