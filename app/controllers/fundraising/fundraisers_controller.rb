class Fundraising::FundraisersController < AuthenticatedController
  respond_to :html

  def index
    @fundraisers = Fundraiser.order(created_at: :desc).decorate
    #TODO ordering
  end

  def new
    @fundraiser = Fundraiser.new
    respond_with @fundraiser
  end

  def create
    @fundraiser = Fundraiser.new(fundraiser_params)
    @fundraiser.user = current_user
    @fundraiser.save
    
    respond_with @fundraiser
  end

  def edit
    @fundraiser = current_user.fundraisers.find(params[:id])
    render 'new'
  end

  def update
    @fundraiser = current_user.fundraisers.find(params[:id])
    @fundraiser.update_attributes(fundraiser_params)
    respond_with @fundraiser
  end

  def show
    @fundraiser = Fundraiser.find(params[:id]).decorate
  end

  def destroy
    unless current_user.admin?
      render nothing: true, status: :unauthorized
      return
    end

    @fundraiser = Fundraiser.find(params[:id])
    @fundraiser.destroy

    redirect_to :back
  end

protected
  def fundraiser_params
    params.require(:fundraiser).permit!
  end

end
