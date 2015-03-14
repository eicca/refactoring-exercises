require "spec_helper"

describe Customer do
  let(:customer) { described_class.new("Ben") }
  let(:new_release) { Movie.new("something new", Movie::NewReleasePrice.new) }
  let(:regular) { Movie.new("something regular", Movie::RegularPrice.new) }
  let(:childrens) { Movie.new("for kids", Movie::ChildrensPrice.new) }
  let(:regular_from_new) do
    obj = new_release.dup
    obj.price = Movie::RegularPrice.new
    obj
  end

  describe "#statement" do
    subject(:statement) { customer.statement }

    before do
      customer.add_rental(Rental.new(new_release, 3))
      customer.add_rental(Rental.new(regular, 1))
      customer.add_rental(Rental.new(childrens, 5))
      customer.add_rental(Rental.new(regular_from_new, 2))
    end

    it { is_expected.to match("something new") }
    it { is_expected.to match("Record for Ben") }
    it { is_expected.to match("owed is 17.5") }
    it { is_expected.to match("5 frequent renter points") }
  end
end
