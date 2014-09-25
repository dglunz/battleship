module Check

  def self.attack(player, coordinates)
    player.fleet.ships.select do |ship|
      ship.location.include?(coordinates)
    end
  end

end
