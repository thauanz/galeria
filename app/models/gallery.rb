class Gallery < ActiveRecord::Base
  attr_accessible :nome, :descricao

  validates_presence_of :nome
  validates_presence_of :descricao
  
  has_many :pictures, dependent: :destroy
end
