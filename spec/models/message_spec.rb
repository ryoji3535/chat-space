require 'rails_helper'

describe Message do
  describe '#create' do

    it "is invalid without a text" do
      message = build(:message, text: "")
      message.valid?
      expect(message.errors[:text]).to eq (["translation missing: ja.activerecord.errors.models.message.attributes.text.blank"])
    end

    it "is valid with a text" do
      message = build(:message)
      expect(message).to be_valid
    end

  end
end
