class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order("created_at")
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params.require(:tweet).permit(:text))

    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update_attributes(params.require(:tweet).permit(:text))
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end


end
