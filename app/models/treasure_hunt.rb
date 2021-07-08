class TreasureHunt < ApplicationRecord
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  before_save :compute_distance
  after_save :notify_winner

  scope :winners, -> { where('winner = ?', true) }
  scope :winners_between, lambda { |start_date, end_date|
                            where(created_at: start_date.to_time.beginning_of_day..end_date.to_time.end_of_day, winner: true)
                          }

  def self.latitude
    50.051227
  end

  def self.longitude
    19.945704
  end

  def compute_distance
    rad_per_deg = Math::PI / 180
    rm = 6_371_000
    lat1_rad = TreasureHunt.latitude * rad_per_deg
    lat2_rad = latitude * rad_per_deg
    lon1_rad = TreasureHunt.longitude * rad_per_deg
    lon2_rad = longitude * rad_per_deg

    a = Math.sin((lat2_rad - lat1_rad) / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    self.distance = (rm * c)
  end

  def notify_winner
    if distance < 5
      self.winner = true
      SuccessMailer.winner.deliver_later
    end
  end
end
