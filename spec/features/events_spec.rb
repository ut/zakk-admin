require 'spec_helper'

describe 'visiting a event show view' do


  it 'does not show a drafted event view to guests' do
    @event = FactoryBot.create(:event, :title => "Drafted Event", :startdate => DateTime.now + 2.days)
    visit "/events/#{@event.id}"
    expect(page).to have_current_path "/"
    expect(page).to have_content "Event is not publically available"
  end

  it 'shows a published, future event view (event) to guests' do
    @event = FactoryBot.create(:event, :title => "Published Event", :status => "Published", :startdate => DateTime.now + 2.days)
    visit "/events/#{@event.id}"
    expect(page).to have_current_path "/events/#{@event.id}"
    expect(page).to have_content('Published Event')
  end

end
