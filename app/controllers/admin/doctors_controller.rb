class Admin::DoctorsController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("ADMIN_USER", "admin"),
                                password: ENV.fetch("ADMIN_PASSWORD", "medhora2024")

  def index
    @pending  = Doctor.pending.includes(:user, medical_certificate_attachment: :blob)
    @approved = Doctor.approved.includes(:user)
    @rejected = Doctor.rejected.includes(:user)
  end

  def approve
    doctor = Doctor.find(params[:id])
    doctor.approved!
    redirect_to admin_doctors_path, notice: "Dr. #{doctor.last_name} aprobado."
  end

  def reject
    doctor = Doctor.find(params[:id])
    doctor.rejected!
    redirect_to admin_doctors_path, notice: "Solicitud de #{doctor.last_name} rechazada."
  end
end
