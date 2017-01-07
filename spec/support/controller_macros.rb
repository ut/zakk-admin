module ControllerMacros

  def self.included(base)
    base.extend(ClassMethods)
  end

  def basic_auth(user, password)
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials user, password
    request.env['HTTP_AUTHORIZATION'] = credentials
  end

  module ClassMethods

    def it_should_redirect_guest_to_login(test_controller)
      describe "#{test_controller} Authentication" do
        it "expect redirect guests to login " do
          get :index
          response.expect redirect_to( new_user_session_path )
        end
      end
    end

    def it_should_not_authorize(test_controller, role)
      describe "#{test_controller} Authentication" do
        xit "expect return unauthorized for user with incorrect role" do
          sign_in create(role)
          lambda { get :index }.expect raise_error( Acl9::AccessDenied )
        end
      end
    end

  end

end
