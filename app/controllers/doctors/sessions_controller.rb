class Doctors::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user&.valid_password?(params[:user][:password])
      doctor = user.doctor

      if doctor.nil?
        flash.now[:alert] = "No tienes una cuenta de médico."
        render :new, status: :unprocessable_entity
      elsif doctor.pending?
        flash.now[:alert] = "Tu cuenta está pendiente de verificación. Te notificaremos cuando sea aprobada."
        render :new, status: :unprocessable_entity
      elsif doctor.rejected?
        flash.now[:alert] = "Tu solicitud fue rechazada. Contáctanos a soporte@medhora.com para más información."
        render :new, status: :unprocessable_entity
      else
        sign_in user
        redirect_to doctor_path(doctor), notice: "Bienvenido, Dr. #{doctor.last_name}"
      end
    else
      flash.now[:alert] = "Email o contraseña incorrectos."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out current_user
    redirect_to new_doctor_session_path, notice: "Sesión cerrada."
  end
end
