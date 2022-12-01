class AdminController < ApplicationController 
  def index
  authenticate_admin!  
  end
  def create
    @product = Product.new({:title => params[:title], :description => params[:description], :price => params[:price], :image => params[:image]})

    if @product.save
      flash[:notice] = "Le produit a bien été créé"
    end
  end
  
  
  protected
  def authenticate_admin!
    authenticate_user!
    redirect_to :root, status: :forbidden unless current_user.admin?
  end 
end
