class UsersController < ApplicationController

  def index
    @users = User.all.order({ :username => :asc })

    @signed_user = User.all.where({:id => session.fetch(:user_id)}).first

    render({:template => "users/index.html.erb"})
  end

  def show
    the_username = params.fetch("username")
    @user = User.where({ :username => the_username }).at(0)
    @signed_user = User.all.where({:id => session.fetch(:user_id)}).first

    if @signed_user != nil
      render({:template => "users/show.html.erb"})
    else
      redirect_to("/user_sign_in", { :alert => "You have to sign in first" })
    end

  end

  def user_feed
    the_username = params.fetch("username")
    @user = User.where({ :username => the_username }).at(0)
    @signed_user = User.all.where({:id => session.fetch(:user_id)}).first

    if @signed_user != nil
      render({:template => "users/feed.html.erb"})
    else
      redirect_to("/user_sign_in", { :alert => "You have to sign in first" })
    end

  end

end
