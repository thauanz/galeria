class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :nome
      t.timestamps
    end
  end
end
