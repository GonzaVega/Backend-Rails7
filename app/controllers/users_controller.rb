class UsersController < ApplicationController
    
    before_action :set_user, only: [:show, :edit, :update, :destroy]
   
    def show
        @conferences = @user.conferences
        @as_speaker_conferences = @user.as_speaker_conferences
    end

    def search
        if params[:search].blank?
            
            redirect_to users_path and return
        else
            @parameter = params[:search].downcase
            @results = User.all.where("lower(username || company) LIKE :search", search: "%#{@parameter}%")
        end
    end

    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def edit
        
    end
    def update
        
        if @user.update(user_params)
            redirect_to @user
            flash[:notice] = "Your account information was successfully updated"
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
           flash[:notice] = "Welcome to ConferencesApp #{@user.username}, you've successfully signed up!"
           redirect_to conferences_path
        else
            render 'new'     
        end
    end

    def destroy
        @user.destroy
        flash[:notice] = "Account and all associated articles where successfully deleted"
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password_digest, :bio, :company )
    end

    def set_user
        @user = User.find(params[:id])
    end
   
end