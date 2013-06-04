class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :gallery # chave estrangeira de gallery, este campo é o correspondente a gallery_id
      t.string :nome

      t.timestamps
    end
    add_index :pictures, :gallery_id # adiciona index na chave estrangeira
  end
end
