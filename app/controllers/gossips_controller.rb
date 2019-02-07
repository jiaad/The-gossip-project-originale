class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end
  
  # def create
  #   @gossip = Gossip.create(gossip_params)
  #   @gossip.user = User.find_by(id: session[:user_id])
  #   if @gossip.save
  #     flash[:success] = "Potin bien créé !"
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end




  def create
    # @user = User.find(params[:id])
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user )
    if @gossip.save#(validate: false)
      redirect_to "/"
      flash[:success] = "ah we t trop fort"
      return
    else
      puts "="*90
      puts @gossip.errors.full_messages
      puts "="*90
      render :new
    end
  end

  #new, #create, #show, #index, #edit, #update et #destroy
  def show
    i = params[:id].to_i
    @gossip = Gossip.find(i)
    @comment = Comment.new
    @comment.gossip_id = @gossip.id

  end
#===================
  def index
    @gossip = Gossip.all
    @user = User.all
    if current_user
      @gossip = current_user.gossips
      render "index.html.erb"
     else 
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/sessions/new'
     end
  end
#===================
  def edit
    i = params[:id].to_i
    @gossip = Gossip.find(i)
  end
#===================
  def update

    @gossip = Gossip.find(params[:id])
    puts params.inspect

    gossip_params = params.require(:gossip).permit(:title, :content)
    
    if @gossip.update(gossip_params)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to "/gossips"
    else

    end
  end
#===================
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to "/gossips"
  end

end
