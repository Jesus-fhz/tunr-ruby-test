class MixtapesController < ApplicationController
  before_action :check_if_logged_in, except: [:index, :show]
  def new
    @mixtape = Mixtape.new
  end

  def create
    @mixtape = Mixtape.new mixtape_params
    @mixtape.user_id = @current_user.id
    @mixtape.save
    if  @mixtape.persisted?
      redirect_to mixtapes_path    
    else
      render :new                                                                                                                                                
    end
  end

  def index
     @mixtapes = Mixtape.all
  end

  def show
  end

  def edit
    @mixtape = Mixtape.find params[:id]
    redirect_to login_path unless @mixtape.user_id == @current_user.id 
  end

  def update
    @mixtape = Mixtape.find  params[:id]
    #Don't perform the edit on this item if the ids don't match
    if @mixtape.user_id != @current_user.id #Trying to edit something that's from its user
        return redirect_to login_path 
    end
    if @mixtape.update mixtape_params
      redirect_to mixtape_path(@mixtape.id)
    else
      render :edit
    end
  
  end

  def destroy
  end

  private def mixtape_params
    params.require(:mixtape).permit(:name, :iamge)
  end
end