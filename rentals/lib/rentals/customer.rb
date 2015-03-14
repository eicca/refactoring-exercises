# Represents customers.
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    result = "Rental Record for #{@name}\n"
    result += @rentals.reduce("") do |text, rental|
      text + "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
    end
    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  private

  def total_charge
    @rentals.reduce(0) do |sum, rental|
      sum + rental.charge
    end
  end

  def total_frequent_renter_points
    @rentals.reduce(0) do |sum, rental|
      sum + rental.frequent_renter_points
    end
  end

end
