class PagesController < ApplicationController
  before_action :set_medicos

  def home
  end

  def show_medico
    # Buscamos el médico simulado según el ID que viene en la URL
    @medico = @medicos.find { |m| m[:id] == params[:id].to_i }

    # Si no lo encuentra, agarramos el primero por las dudas
    @medico ||= @medicos.first
  end

  private

  def set_medicos
    @medicos = [
      { id: 1, nombre: "Dr. Carlos Mendoza", especialidad: "Cardiología",
        descripcion: "Especialista en prevención avanzada y salud cardiovascular asistida por IA.", universidad: "UBA - Diploma de Honor", experiencia: "12 años de experiencia clínica" },
      { id: 2, nombre: "Dra. Sofía Altieri", especialidad: "Pediatría",
        descripcion: "Atención infantil integral con seguimiento clínico digital personalizado.", universidad: "Universidad de Córdoba", experiencia: "8 años en pediatría del desarrollo" },
      { id: 3, nombre: "Dr. Martín Silva", especialidad: "Neurología",
        descripcion: "Consultas neurológicas avanzadas y análisis de diagnóstico preventivo.", universidad: "Universidad de La Plata", experiencia: "15 años en investigación neuroclínica" }
    ]
  end
end
