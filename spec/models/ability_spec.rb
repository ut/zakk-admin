require 'rails_helper'
require "cancan/matchers"

RSpec.describe Ability, type: :model do
  describe "User" do
    describe "abilities" do
      subject(:ability){ Ability.new(user) }
      let(:user){ nil }


      context "... when guest" do
        # let(:user){ ) }
        it{ should be_able_to(:read, User.new) }

        it{ should_not be_able_to(:create, Program.new) }
        it{ should_not be_able_to(:create, Event.new) }
        it{ should_not be_able_to(:create, Location.new) }
        it{ should_not be_able_to(:create, Content.new) }

        it{ should_not be_able_to(:destroy, Program.new) }
        it{ should_not be_able_to(:destroy, Event.new) }
        it{ should_not be_able_to(:destroy, Location.new) }
        it{ should_not be_able_to(:destroy, Content.new) }
      end

      context "... when normal user" do
        let(:user){ FactoryBot.create(:user_with_user_role) }

        it{ should_not be_able_to(:manage, User.new) }
        it{ should be_able_to(:manage, Program.new) }
        it{ should be_able_to(:manage, Event.new) }
        it{ should be_able_to(:manage, Location.new) }
        it{ should be_able_to(:manage, Content.new) }
      end

      context "... when admin" do
        let(:user){ FactoryBot.create(:user_with_admin_role) }

        it{ should be_able_to(:manage, User.new) }
        it{ should be_able_to(:manage, Program.new) }
        it{ should be_able_to(:manage, Event.new) }
        it{ should be_able_to(:manage, Location.new) }
        it{ should be_able_to(:manage, Content.new) }
      end
    end
  end
end