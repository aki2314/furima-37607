class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase,       null: false, foreign_key: true 
      t.string :post_number,        null: false                    
      t.integer :shipmentsource_id, null: false                    
      t.string :si,                 null: false                    
      t.string :banti,              null: false                    
      t.string :building                                       
      t.string :phone,              null: false    
      t.timestamps
    end
  end
end
