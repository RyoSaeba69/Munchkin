class CompteursController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    if params[:search].present?
      @search = params[:search].strip
      @compteurs = Compteur.search(@search).order("created_at DESC")
    else
      @compteurs =Compteur.order("created_at DESC")
    end
  end

  def show
    @compteur = Compteur.find(params[:id])
  end

  def edit
    @compteur = Compteur.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def update
    @compteur = Compteur.find(params[:id])
    respond_to do |format|
      if @compteur.update_attributes(compteur_params)
        format.html { redirect_to @compteur, success: 'Le compteur a été mise à jour avec succès' }
        format.json { render :show, status: :ok, location: @compteur }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @compteur.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @compteur = Compteur.new
  end

  def create
    @compteur = Compteur.new
    respond_to do |format|
      if @compteur.update(compteur_params)
        format.html { redirect_to @compteur, notice: 'Le compteur a été créé avec succès' }
        format.json { render json: @compteur, status: :created, location: @compteur }
      else
        format.html { render action: "new" }
        format.json { render json: @compteur.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def compteur_params
    params.require(:compteur).permit(:libelle,:image,:edition_id)
  end
end
