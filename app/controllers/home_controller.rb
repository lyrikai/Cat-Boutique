class HomeController < ApplicationController

    def index
        @catlist = Product.all
    end
end
