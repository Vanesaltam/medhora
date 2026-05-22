class DoctorsController < ApplicationController
  def index
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @user   = User.new
    @doctor = Doctor.new
  end

  def create
    @user   = User.new(user_params)
    @doctor = @user.build_doctor(doctor_params)

    ActiveRecord::Base.transaction do
      @user.save!
      @doctor.save!
    end

    redirect_to new_doctor_session_path,
      notice: "Solicitud enviada. Revisaremos tu título y te notificaremos cuando tu cuenta esté aprobada."
  rescue ActiveRecord::RecordInvalid => e
    @doctor.errors.merge!(e.record.errors) if e.record != @doctor
    render :new, status: :unprocessable_entity
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor), notice: "Perfil actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Doctor.find(params[:id]).destroy
    redirect_to root_path, notice: "Cuenta eliminada."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def doctor_params
    params.require(:doctor).permit(
      :first_name, :last_name, :specialty,
      :license_number, :consultation_price, :medical_certificate
    )
  end
end
