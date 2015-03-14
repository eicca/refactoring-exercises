# Represents movies.
class Movie
  class RegularPrice
    def frequent_renter_points(_)
      1
    end

    def charge(days_rented)
      result = 2
      result += (days_rented - 2) * 1.5 if days_rented > 2
      result
    end
  end

  class NewReleasePrice
    def frequent_renter_points(days_rented)
      days_rented > 1 ? 2 : 1
    end

    def charge(days_rented)
      days_rented * 3
    end
  end

  class ChildrensPrice
    def frequent_renter_points(_)
      1
    end

    def charge(days_rented)
      result = 1.5
      result += (days_rented - 3) * 1.5 if days_rented > 3
      result
    end
  end

  attr_reader :title
  attr_writer :price

  def initialize(title, price)
    @title, self.price = title, price
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end
end
