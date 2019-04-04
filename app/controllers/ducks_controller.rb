class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def new
    @duck=Duck.new
  end

  def create
  @duck= Duck.new(duck_params)
    if @duck.save
    redirect_to @duck
  else
    render :edit
  end
end

  def edit
    @duck=Duck.find(params[:id])
  end

  def update
    @duck=Duck.find(params[:id])
      if @duck.update(duck_params)
        redirect_to duck_path(@duck)
      else
        render :edit
    end
  end

  def show
    @duck=Duck.find(params[:id])
  end

  private

  def duck_params
    params.require(:duck).permit!
  end

end
