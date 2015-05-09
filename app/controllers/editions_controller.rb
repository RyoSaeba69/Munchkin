class EditionsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    if params[:search].present?
      @search = params[:search].strip
      @editions = Edition.search(@search).order("created_at DESC")
    else
      @editions =Edition.order("created_at DESC")
    end
  end

  def show
    @edition = Edition.find(params[:id])
  end

  def edit
    @edition = Edition.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def update
    @edition = Edition.find(params[:id])
    respond_to do |format|
      if @edition.update_attributes(edition_params)
        format.html { redirect_to @edition, success: "L'édition a été mise à jour avec succès" }
        format.json { render :show, status: :ok, location: @edition }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @edition.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @edition = Edition.new
  end

  def create
    @edition = Edition.new
    respond_to do |format|
      if @edition.update(edition_params)
        format.html { redirect_to @edition, notice: "L'édition a été créée avec succès" }
        format.json { render json: @edition, status: :created, location: @edition }
      else
        format.html { render action: "new" }
        format.json { render json: @edition.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def edition_params
    params.require(:edition).permit(:libelle,:icon)
  end
end
