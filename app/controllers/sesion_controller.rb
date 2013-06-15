class SesionController < ApplicationController
  def new
  end

  def create
    persona = Persona.find_by(nombre: sesion_params[:nombre])

    if persona && persona.authenticate(sesion_params[:password])
      session[:persona_id] = persona.id
      redirect_to personas_url, notice: 'Has ingresado correctamente'
    else
      flash.now.alert = 'Nombre o clave incorrecto'
      render 'new'
    end
  end

  def destroy
    session[:persona_id] = nil
    redirect_to root_url, notice: 'Has salido correctamente'
  end

  private

    def sesion_params
      params.require(:sesion).permit(:nombre, :password)
    end
end
