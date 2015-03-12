require "spec_helper"

describe Customer do
  let(:customer) { described_class.new("Ben") }
  let(:new_release) { Movie.new("something new", Movie::NEW_RELEASE) }
  let(:regular) { Movie.new("something regular", Movie::REGULAR) }
  let(:childrens) { Movie.new("for kids", Movie::CHILDRENS) }

  describe "#statement" do
    subject(:statement) { customer.statement }

    before do
      customer.add_rental(Rental.new(new_release, 3))
      customer.add_rental(Rental.new(regular, 1))
      customer.add_rental(Rental.new(childrens, 5))
    end

    it { is_expected.to match("something new") }
    it { is_expected.to match("Record for Ben") }
    it { is_expected.to match("owed is 15.5") }
    it { is_expected.to match("4 frequent renter points") }
  end
end
