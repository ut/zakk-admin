require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  it "returns events 'with_status', with a specific status" do
    event = FactoryBot.create(:event)
    expect(Event.with_status("Draft")).to include(event)
  end

  it "returns events 'with_status', with a specific status" do
    event = FactoryBot.create(:event, :status => 'Published')
    expect(Event.with_status("Published")).to include(event)
  end

  it "returns starttime for a certain event" do
    event = FactoryBot.create(:event)
    expect(event.starttime).to eq('15.13')
  end

  it "returns startday for a certain event" do
    event = FactoryBot.create(:event)
    expect(event.startday).to eq('16.3')
  end

  it "returns startweekday for a certain event" do
    event = FactoryBot.create(:event)
    expect(event.startweekday).to eq('Montag')
  end

end
