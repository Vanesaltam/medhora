class MedicosController < ApplicationController
  def index
    # Vinculamos tu variable con el modelo en inglés de tus compañeros
    @medicos = Doctor.all
  end

  def show
    # Para cuando hagamos la vista individual de cada doctor
    @medico = Doctor.find(params[:id])
  end
end
