class Song < ApplicationRecord
  has_many :answers

  def self.last_song
    Song.where('date <= ?', DateTime.now).order('date DESC').first
  end

  def self.next_song
    Song.where('date > ?', DateTime.now).order('date').first
  end

  def self.current_song
    song = Song.last_song
    song.nil? || !song.available? ? nil : song
  end

  def available?
    DateTime.now >= date && DateTime.now <= date + duration.seconds && answers.where(correct: true).count < 3
  end
end
