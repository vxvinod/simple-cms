class PagesController < ApplicationController
  
  def index
  	@pages = Page.all
  end

  def show
  	@page = Page.find(params[:id])
  end

  def new
  	@page = Page.new
  end

  def create
  	@page = Page.new(page_params)
  	if(@page.save)
  		flash[:notice] = "Page added successfully"
  		redirect_to :action => "index"
  	else
  		render "new"
  	end
  end

  def edit
  	@page = Page.find(params[:id])
  end

  def update
  	@page = Page.find(params[:id])
  	if @page.update_attributes(page_params)
  		flash[:notice] = "Page updated successfully"
  		redirect_to :action => "show", :id => @page.id
  	else
  		render "edit"
  	end
  end

  def delete
  	@page = Page.find(params[:id])
  end

  def destroy
  	page = Page.find(params[:id])
  	page.destroy
  	flash[:notice] = "pages deleted successfully"
  	redirect_to :action => "index"
  end

  private
  def page_params
  	params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
  end

end
