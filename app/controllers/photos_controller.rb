class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @signed_user_id = session.fetch(:user_id)

    matching_photos = Photo.where({ :id => the_id })

    @the_photo = matching_photos.at(0)

    render({ :template => "photos/show.html.erb" })
  end

  def create
    the_photo = Photo.new
    the_photo.poster = User.where({:id => session.fetch(:user_id)}).at(0)
    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")
    the_photo.owner_id = params.fetch("query_owner_id")
    the_photo.likes_count = params.fetch("query_likes_count")
    the_photo.comments_count = params.fetch("query_comments_count")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos/#{the_photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{the_photo.id}", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end


  def like
    the_like = Like.new
    the_like.photo_id = params.fetch("query_photo_id")
    the_like.fan_id = params.fetch("query_fan_id")

    if the_like.valid?
      the_like.save
      redirect_to("/photos/#{the_like.photo_id}", { :notice => "Like created successfully." })
    else
      redirect_to("/photos/#{the_like.photo_id}", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def unlike
    the_id = params.fetch("photo_id")
    @signed_user_id = session.fetch(:user_id)
    the_like = Like.where({ :photo_id => the_id }).where({:fan_id => @signed_user_id}).at(0)

    the_like.destroy

    redirect_to("/photos/#{the_id}", { :notice => "Like deleted successfully."} )
  end

end
