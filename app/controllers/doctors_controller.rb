class DoctorsController < ApplicationController
  def index
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def pending
  end

  def new
    @user   = User.new
    @doctor = Doctor.new
  end

  def create
    @user   = User.new(user_params)
    @doctor = Doctor.new(doctor_params)
    @doctor.user = @user

    user_valid   = @user.valid?
    doctor_valid = @doctor.valid?

    unless user_valid && doctor_valid
      render :new, status: :unprocessable_entity
      return
    end

    ActiveRecord::Base.transaction do
      @user.save!
      @doctor.save!
    end

    redirect_to doctor_pending_path,
      notice: "¡Solicitud enviada! Revisaremos tu título y te notificaremos cuando tu cuenta esté aprobada."
  rescue ActiveRecord::RecordInvalid
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
