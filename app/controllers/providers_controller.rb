class ProvidersController < ApplicationController
  before_action :authenticate_user!, except: [:show_profile_image, :index, :show] 
  before_action :authenticate_provider!
  def index
    @providers = Provider.all
  end
  
  def show
    @provider = Provider.find(params[:id])
  end
  
  def show_profile_image
    @provider = Provider.find(params[:id])
    @image = @provider.profile_image
    send_data @image, type: 'image/png', disposition: 'inline'
  end
end
