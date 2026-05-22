class CinemaHalls
  def self.find(name)
    halls[name] || halls["Зал 1"]
  end

  def self.halls
    {
      "Зал 1" => { rows: 11, seats_per_row: 18 },
      "Зал 2" => { rows: 10, seats_per_row: 16 },
      "Зал 3" => { rows: 9, seats_per_row: 16 },
      "Зал 4" => { rows: 9, seats_per_row: 18 },
      "LUX 1" => { rows: 6, seats_per_row: 10 },
      "LUX 2" => { rows: 5, seats_per_row: 8 }
    }
  end
end
