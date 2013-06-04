class Picture < ActiveRecord::Base
  belongs_to :gallery # representacao da chave estrangeira
  
  attr_accessible :nome, :gallery_id, :image
  
  validates_presence_of :nome
  
  validates_presence_of :gallery_id
  
  mount_uploader :image, ImageUploader  # monta o uploader no campo image
end
