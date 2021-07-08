class TreasureHunt < ApplicationRecord
  validates :current_location, presence: true, length: {
    is: 2,
    message: 'Format allowed: [:latitude, :longitude]'
  }
  validates_presence_of :email
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  before_validation :validate_request_limit

  before_save :compute_distance
  after_save :notify_winner

  scope :between, lambda { |start_date, end_date|
    where(created_at: start_date.to_time.beginning_of_day..end_date.to_time.end_of_day)
  }
  scope :inside_radius, ->(distance) { where('distance < ?', distance) }
  scope :request_for_an_hour, ->(email) {where(email: email).where(created_at: 1.hour.ago..Time.now)}

  def self.latitude
    50.051227
  end

  def self.longitude
    19.945704
  end

  def validate_request_limit
    if TreasureHunt.request_for_an_hour(email).size >= 20
      self.errors.add(:base, "Reached maximum request for an hour.")
    end
  end

  def compute_distance
    rad_per_deg = Math::PI / 180
    rm = 6_371_000
    lat1_rad = TreasureHunt.latitude * rad_per_deg
    lat2_rad = current_location[0] * rad_per_deg
    lon1_rad = TreasureHunt.longitude * rad_per_deg
    lon2_rad = current_location[1] * rad_per_deg

    a = Math.sin((lat2_rad - lat1_rad) / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    self.distance = (rm * c)
    self.winner = true if distance < 5.0
  end

  def notify_winner
    SuccessMailer.winner.deliver_later if winner
  end
end
