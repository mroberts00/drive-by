class ApplicationController < ActionController::Base
    def current_shooting
        @current_shooting = Shooting.last
    end
end
