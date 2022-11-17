class UsersController < ApplicationController

  def index
    @users = User.all.order({ :username => :asc })

    @signed_user = User.all.where({:id => session.fetch(:user_id)}).first

    render({:template => "users/index.html.erb"})
  end

  def show

    render({:template => "users/show.html.erb"})
  end

end
