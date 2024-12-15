require 'rails_helper'

RSpec.describe Node, type: :model do
  context "Given a node and a locatable" do
    it "returns its base and delegated attributes" do
      create(:node, label: "foo", description: "bar")
      n = Node.find_by(label: "foo")
      expect(n.label).to eq "foo"
      expect(n.description).not_to eq "bar"
      expect(n.description).to eq n.locatable.description
    end
  end

  context "Given one edge and one neighbor" do
    it "identifies the neighbor and excludes itself" do
      n1 = create(:node, :with_neighbors, neighbor_count: 2)
      expect(n1.neighbors.count).to eq 2
      expect(n1.nodes.count).to eq 4 #The 2 neighbor nodes, plus itself twice (since 'nodes' is all nodes on each edge, including itself)
      expect(n1.edges.count).to eq 2
      expect(n1.portals.count).to eq 2
    end
  end
end
