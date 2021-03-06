class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false                    
      t.text :detail,               null: false                    
      t.integer  :category_id,      null: false                    
      t.integer :status_id,         null: false                    
      t.integer :shipmentsource_id, null: false                    
      t.integer  :price,            null: false                    
      t.integer  :derivalyprice_id, null: false                    
      t.integer :derivalyday_id,    null: false                    
      t.references :user,           null: false, foreign_key: true 
      t.timestamps
    end
  end
end
