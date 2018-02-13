class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render "index"
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /users/1
  # # DELETE /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user
  #     @user = User.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def user_params
  #     params.require(:user).permit(:name, :location, :language, :comment)
  #   end


    #--------------------Alex's shit from here----------
    def begin
      render "begin"
    end

    def creat

      if params[:loc] == "1"
        params[:loc] = "Mountain View"
      elsif params[:loc] == "2"
        params[:loc] = "Seattle"
      elsif params[:loc] == "3"
        params[:loc] = "Burbank"
      end

      if params[:lang] == "1"
        params[:lang] = "Javascript"
      elsif params[:lang] == "2"
        params[:lang] = "Python"
      elsif params[:lang] == "3"
        params[:lang] = "Ruby"
      end

      a = User.new(name:params[:name], location: params[:loc], language: params[:lang], comment:params[:comment])
      if a.valid?
        a.save
        flash[:count] = 0
        b = User.all
        b.each do |p|
          flash[:count] += 1
        end
        flash[:success] = "Success! With #{flash[:count]} number of users"
      end
      redirect_to "/result"
    end

    def display
      @name = User.last.name
      @loc = User.last.location
      @lang = User.last.language
      @comment = User.last.comment
      render "user_info"
    end

end
