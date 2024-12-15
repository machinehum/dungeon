require 'rails_helper'

RSpec.describe Game, type: :model do
  context "assertive_npc?" do
    context "given no NPC" do
      it "returns false" do
        g = create :game
        expect(g.assertive_npc?).to be_falsey
      end
    end
    context "given an inactive, non-assertive NPC" do
      it "returns false" do
        g = create(:game, :with_inactive_npc)
        expect(g.assertive_npc?).to be_falsey
      end
    end
    context "given an active, non-assertive NPC" do
      it "returns false" do
        g = create(:game, :with_active_npc)
        expect(g.assertive_npc?).to be_falsey
      end
    end
    context "given an inactive, assertive NPC" do
      it "returns true" do
        g = create(:game, :with_inactive_assertive_npc)
        expect(g.assertive_npc?).to be_falsey
      end
    end
    context "given an active, assertive NPC" do
      it "returns true" do
        g = create(:game, :with_active_assertive_npc)
        expect(g.assertive_npc?).to be_truthy
      end
    end
  end

  context "assertive_npc" do
    context "given an inactive, assertive NPC" do
      it "returns no npc" do
        g = create(:game, :with_inactive_assertive_npc)
        expect(g.assertive_npc).to be_nil
      end
    end
    context "given an active, assertive NPC" do
      it "returns that npc" do
        g = create(:game, :with_active_assertive_npc)
        expect(g.assertive_npc).not_to be_nil
        expect(g.assertive_npc.node_encounterables.first.node).to eq g.node
        n1 = create :node
        expect(g.assertive_npc.node_encounterables.first.node).not_to eq n1
      end
    end
  end
end
