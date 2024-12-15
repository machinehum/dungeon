require 'rails_helper'

RSpec.describe Terra, type: :model do
  it "can be created and retrieved" do
    create(:terra, label: "foo", description: "bar")
    r = Room.find_by(label: "foo")
    expect(r.label).to eq "foo"
    expect(r.description).to eq "bar"
  end
end
