class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  def home
    song = Song.where('date >= ?', DateTime.now).order('date').first

    if song.nil?
      @song_available = false
    else
      @seconds = song.date - DateTime.now

      @song_available = DateTime.now >= song.date && DateTime.now <= song.date + song.duration
    end

    @answer = Answer.new

    @song_available = true
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_code])
  end
end
