class MatchController < ApplicationController
  def match_request
    @user = current_user
    @partner = User.find(params[:id]) # this is the id of the user you want to become a match with
    @match = Match.create(user: current_user, partner: partner, accepted: false)
  end

  def match_request_accept
    # accepting a match request is done by the recipient of the match request.
    # thus the current user is identified by to_id.

    match = Match.where(to_id: current_user.id, partner_id: params[:id]).first
    match.update_attributes(accepted: true)
    flash[:success] = "Partnership confirmed!"
  end

  def match_request_reject
    match = Match.where(to_id: current_user.id, partner_id: params[:id]).first
    match.destroy
    flash[:success] = "Sorry Match Request was denied."
  end

end
