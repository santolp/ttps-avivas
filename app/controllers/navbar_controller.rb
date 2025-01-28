class NavBarController < ApplicationController
    def index
        render file: 'views/navbar/_navbar.html.erb'
    end
end