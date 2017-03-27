class Site::HomeController < ApplicationController

  layout "site"

  def index
    @controls = Control.all
  end
end
