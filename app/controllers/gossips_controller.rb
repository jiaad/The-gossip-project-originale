class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end
  
  def create
    # @user = User.find(params[:id])
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id:8 )
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
