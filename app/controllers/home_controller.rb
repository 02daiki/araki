class HomeController < ApplicationController

    def index

    end

    def home

    end

    def manager
        @blog = Blog.all
    end
end
