class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def persona_actual
    @persona_actual ||= Persona.find(session[:persona_id]) if session[:persona_id]
  end

  def requerir_persona
    redirect_to root_url, notice: 'Debe estar autenticado' unless persona_actual
  end

  helper_method :persona_actual
end
