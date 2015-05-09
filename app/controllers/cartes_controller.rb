class CartesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    if params[:search].present?
      @search = params[:search].strip
      @cartes = Carte.search(@search).order("created_at DESC")
    else
      @cartes =Carte.order("created_at DESC")
    end
  end

  def show
    @carte = Carte.find(params[:id])
  end

  def edit
    @carte = Carte.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def update
    @carte = Carte.find(params[:id])
    respond_to do |format|
      if @carte.update_attributes(carte_params)
        format.html { redirect_to @carte, success: 'La carte a été mise à jour avec succès' }
        format.json { render :show, status: :ok, location: @carte }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @carte.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @carte = Carte.new
  end

  def create
    @carte = Carte.new
    respond_to do |format|
      if @carte.update(carte_params)
        format.html { redirect_to @carte, notice: 'La carte a été créée avec succès' }
        format.json { render json: @carte, status: :created, location: @carte }
      else
        format.html { render action: "new" }
        format.json { render json: @carte.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def carte_params
    params.require(:carte).permit(:libelle,:image,:carte_type_id,:edition_id)
  end

end
