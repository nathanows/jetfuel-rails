class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long
      t.string :short
      t.string :title

      t.timestamps null: false
    end
  end
end
