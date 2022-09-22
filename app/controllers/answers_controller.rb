class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    song = Song.current_song
    if song.nil?
      redirect_to root_path, alert: 'Błąd. Brak ustawionej piosenki.'
      return
    end

    current_user_answers = song.answers.where(user: current_user, correct: true)
    if current_user_answers.any?
      redirect_to root_path, alert: 'Już odpowiedziałeś na te zagadkę :)'
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

    good_answers = song.answers.where(correct: true)
    if good_answers.count > 3
      redirect_to root_path, alert: 'Dobra odpowiedź, ale niestety nie zdążyłeś :('
      return
    end

    generate_voucher(song)
    redirect_to root_path, notice: 'Dobra odpowiedź! Wygrywasz!'
  end

  def generate_voucher(song)
    templates = VoucherTemplate.all
    values = []
    templates.each do |template|
      template.chance.times do
        values << template.title
      end
    end

    Voucher.create!(title: values.sample, user: current_user, song: song)
  end

  def format_title(title)
    # Sou'nd & Grace -> sou'nd & grace
    title = title.downcase
    # sou'nd & grace -> sound & grace
    title = title.gsub("'", "")
    # sound & grace -> sound and grace
    title = title.gsub(" & ", " and ")

    title
  end

  def can_answer

  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
