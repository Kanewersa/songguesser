class AnswersController < ApplicationController
  def create
    song = Song.where('date >= ?', DateTime.now).order('date').first
    if song.nil?
      redirect_to root_path, alert: 'Błąd. Brak ustawionej piosenki.'
      return
    end

    song_title = format_title(song.title)
    answer_title = format_title(params[:answer][:body])

    if answer_title != song_title
      Answer.create!(answer_params.merge({user: current_user, song: song, correct: false}))
      redirect_to root_path, alert: 'Zła odpowiedź!'
      return
    end

    Answer.create!(answer_params.merge({user: current_user, song: song, correct: true}))
    redirect_to root_path, alert: 'Dobra odpowiedź!'
  end

  def format_title(title)
    # Sou'nd & Grace -> sou'nd & grace
    title = title.downcase
    # sou'nd & grace -> sound & grace
    title = title.gsub!("'", "")
    # sound & grace -> sound and grace
    title = title.gsub!(" & ", " and ")

    title
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
