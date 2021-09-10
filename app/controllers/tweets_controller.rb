class TweetsController < ApplicationController
<<<<<<< HEAD
    before_action :logged_in_user, only: [:create, :destroy, :edit, :update]
    before_action :correct_user, only: [:destroy, :edit, :update]

    def create
        @tweet = current_user.tweets.build(tweet_params)
        if @tweet.save
            flash[:success] = "投稿されました！"
            redirect_to root_url
        else
            render "static_pages/home"
        end
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            flash[:success] = "変更を保存しました。"
            redirect_to root_url
        else
            render "edit"
        end
    end

    def destroy
        @tweet.destroy
        flash[:success] = "削除しました"
        redirect_to request.referrer || root_url
    end

    private
        def tweet_params
            params.require(:tweet).permit(:content)
        end

        def correct_user
            @tweet = current_user.tweets.find_by(id: params[:id])
            if @tweet.nil?
                flash[:danger] = "不正なアクセスです"
                redirect_to root_url
            end
        end
=======
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
>>>>>>> 003a6a86eaa0dc910f09d3cb95fdc47fc4f02fc1
end
