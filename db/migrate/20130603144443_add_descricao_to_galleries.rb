class AddDescricaoToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :descricao, :string
  end
end
