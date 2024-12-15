require 'rails_helper'

RSpec.describe Room, type: :model do

  it "can be created and retrieved" do
    create(:room, label: "foo", description: "bar")
    r = Room.find_by(label: "foo")
    expect(r.label).to eq "foo"
    expect(r.description).to eq "bar"
  end
end
