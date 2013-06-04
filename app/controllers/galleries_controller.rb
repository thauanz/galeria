class GalleriesController < ApplicationController
  
  before_filter :find_gallery, except: [:index, :new, :create, :pictures]
  before_filter :authenticate_user!
   
  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  def edit
  end

  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end
  
  def pictures
    @gallery = Gallery.find(params[:gallery_id])
    @pictures = Picture.where(gallery_id: @gallery)
    # A query acima pode ser feita da forma abaixo pois fizemos as ligacoes entre modelos
    # @pictures = @gallery.pictures
  end
  
  protected
  
  def find_gallery
    @gallery = Gallery.find(params[:id])
  end
end
