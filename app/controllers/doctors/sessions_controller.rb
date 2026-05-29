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
        redirect_to doctor_pending_path,
          notice: "Tu cuenta está pendiente de verificación. Te avisaremos cuando sea aprobada."
      elsif doctor.rejected?
        redirect_to doctor_pending_path,
          alert: "Tu solicitud fue rechazada. Contactá a soporte@medhora.com para más información."
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
