class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def show; end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity, alert: 'Portfolio item was not created!' }
      end
    end
  end

  def edit; end

  def update; end

  def destroy; end
end
