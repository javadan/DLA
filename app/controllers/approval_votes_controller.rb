class ApprovalVotesController < AuthenticatedController

  decorates_assigned :candidate

  before_action :find_candidate

  def create
    if current_user.approval_votes.where(candidate: @candidate).any?
      redirect_to :back, alert: "You can't vote twice for the same candidate."

    else

      @approval_vote = current_user.approval_votes.where(candidate: @candidate).create(approval_vote_params)

      if @approval_vote.persisted?
        redirect_to :back, notice: 'Your vote has been cast.'
      else
        binding.pry
        raise @approval_vote.inspect
        redirect_to :back, alert: 'Aw snap, we couldnt cast your vote :('
      end
    end

  end

  def destroy
    @approval_vote = current_user.approval_votes.find(params[:id])
    @approval_vote.destroy

    redirect_to :back, notice: 'Your vote has been undone.'
  end

  protected
    def find_candidate
      @candidate = User.where(approved: false).find(params[:approval_id])
    end

    def approval_vote_params
      params[:approval_vote].permit(:vote, :comment)
    end
end
