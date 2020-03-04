class UsersController < ApplicationController

  def signup
    user = User.create(user_params)

    if user.valid? 
      # render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id) }, status: :accepted
      # refactored after moving issue_token to user.rb
      render json: user 
    else
      # byebug
      render json: { errors: user.errors.full_messages }, status: :unauthorized
    end
  end


  def login
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      render json: user
    else
      render json: { error: "Please try again" }, status: :not_acceptable
    end
  end



  def validate 
    #sending localStorage.token to validate if a user's already logged in; if there's a logged in user, it'll send back user object
    if logged_in?
      # render json: { user: UserSerializer.new(@current_user), token: issue_token(user_id: @current_user.id) }, status: :accepted
      # refactored after moving issue_token to user.rb
      render json: @current_user 
    else
      render json: { error: "Please try again" }, status: :not_acceptable
    end
  end

  def index
    users = User.all 
    ordered_users =  users.sort_by{ |user| user[:created_at]}.reverse
    render json:  ordered_users, each_serializer: PublicUserSerializer     
  end 

  def show
    user = User.find(params[:id])
    if user 
      render json:user, serializer: UserSerializer
    else
      render json: { error: "We can't find who you are looking for" }, status: :not_acceptable
    end
  end

  def posts
    user = @current_user

    if user   
      my_posts = user.posts 
      ordered_my_posts = my_posts.sort_by{ |post| post[:created_at]}.reverse
      render json: ordered_my_posts 
    else
      render json: { error: 'Ooooopsie. Try posting something.'}
    end
  end

  def received_messages 
    user = User.find(params[:id])

    if user   
      received_msg = user.received_messages
      ordered_received_msg = received_msg.sort_by{ |msg| msg[:received_at]}.reverse
      render json: ordered_received_msg
    else
      render json: { error: 'Ooooopsie. You have not heard from anyone yet.'}
    end
  end
  
  def update
    # byebug
    user = @current_user
    if user 
      user.update(user_params.select{|key,val| key != 'specialty' && key != 'location'})
      
      if user_params[:location]
        if user.location 
          # byebug
          user.location.update(user_params[:location])
        else
          user.location = Location.create(user_params[:location])
        end
      end

      if user_params[:specialty]
        if user.field == 'vocalist'
          if user.vocal 
            user.vocal.update(user_params[:specialty])
          else
            user.vocal = Vocal.create(user_params[:specialty])
          end
        else
        # byebug
          if user.instrumental 
            user.instrumental.update(user_params[:specialty])
          else
            user.instrumental = Instrumental.create(user_params[:specialty])
          end
        end
      end

      render json: user 
    else
      render json: { error: "Somthing didn't seem right"}, status: :not_acceptable
    end
  end

  def file_upload
    case upload_params[:file][:type]
    when "cv"
      #  byebug 
      if @current_user.cv.attached? 
        @current_user.cv.purge
      end
      @current_user.cv.attach(upload_params[:file][:file])
      @current_user.cv.save
      cv_url = url_for(upload_params[:file])
      render json: { 
        message:"You have uploaded the file successflly"
      }
    when "repertoire_list"
      #  byebug 
      if @current_user.repertoire_list.attached?
        @current_user.repertoire_list.purge
      end
      @current_user.repertoire_list.attach(upload_params[:file][:file])
      @current_user.repertoire_list.save
      rep_url = url_for(upload_params[:file])
      render json: { 
        message:"You have uploaded the file successflly"
      }
    when "resume"
      # byebug
      if @current_user.resume.attached?
        @current_user.resume.purge_later
      end
      @current_user.resume.attach(upload_params[:file][:file])
      @current_user.resume.save
      resume_url = url_for(upload_params[:file])
      render json: { 
        message:"You have uploaded the file successflly"
      }
    end
  end

  def show_file
    @user = User.find(params[:id])
    render json: { url_resume: url_for(@user.resume), 
                   url_cv: url_for(@user.cv),  
                   url_rep: url_for(@user.repertoire_list)}
  end

  private
  def user_params
    params.require(:user).permit(
      :id,
      :first_name, 
      :last_name, 
      :email, 
      :password, 
      :password_confirmation, 
      :bio_content, 
      :field, 
      :specialty=>[:voice_type, :instrument],
      :location=>[:street, :city_town, :state_province, :country, :post_code],
    )
  end

  def upload_params
    params.permit(:file=>[:file, :type, :title])
  end
end
