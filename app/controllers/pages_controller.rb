class PagesController < ApplicationController
  before_action :authenticate_admin!, only: [:admin]

  def home
    return if verify_voucher_templates!

    return redirect_to used_vouchers_path unless user_signed_in?

    # Display notice if event has just finished
    if params[:finished].present?
      flash[:alert] = 'Koniec konkursu! 3 osoby poprawnie odpowiedziały na zagadkę.'
    end

    song = Song.last_song

    # No previous songs
    if song.nil?
      render_next_song
      return
    end

    # Check if this song is available
    if song.available?
      render_song
    else
      render_next_song
    end
  end

  def error
    @error = params[:error]
  end

  def used_vouchers
    @vouchers = Voucher.where.not(used_date: nil).order(used_date: :desc).last(10)
  end

  def send_contact
    ContactMailer.with(message: params[:message]).new_contact_message.deliver_later

    redirect_to contact_path, notice: 'Twoja wiadomość została wysłana!'
  end

  def contact

  end

  def info

  end

  def admin

  end

  private

  def verify_voucher_templates!
    return nil if VoucherTemplate.any?

    redirect_to error_path(error: 'Could not find any Voucher Templates.')
  end

  def render_song
    @song_available = true
    @answer = Answer.new
  end

  def render_next_song
    @song_available = false

    song = Song.next_song
    @seconds = song.nil? ? 199 * 24 * 60 * 60 : song.date - DateTime.now
  end
end
