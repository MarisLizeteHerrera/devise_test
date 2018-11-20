class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  
  def index
    @pets = current_user.pets
  end

  def show
    
  end

  def new
    @pet = Pet.new
    render partial: "form"
  end
  
  def create
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      render.new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @pet.update(pet_params)
      redirect_to pets_path
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :animal, :color)
    end

end