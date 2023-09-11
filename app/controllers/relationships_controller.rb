class RelationshipsController < ApplicationController
  def create
    unless Relationship.exists?(follower_id: current_user.id, followed_id: params[:user_id])
      relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
      relationship.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if Relationship.exists?(follower_id: current_user.id, followed_id: params[:user_id])
      relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
      relationship.destroy
    end
    redirect_back(fallback_location: root_path)
  end
end
