class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comment = Comment.new
    @spec_id = params[:spec_id]
    @spec = Spec.find(@spec_id)
    @user_id = current_user.id
    @comment_hash = comment_hash(Comment.where(:spec_id => @spec_id))
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @parent = Comment.find(params[:parent_id])
    @spec_id = @parent.spec_id
    @spec = Spec.find(@spec_id)
    @user_id = current_user.id
    # @comment_hash = comment_hash(Comment.where(:spec_id => @spec_id))
  end

  # GET /comments/1/edit
  def edit
  end
  
  def resolve
    @comment = Comment.find(params[:comment_id])
    
    @comment.update!(:resolved => true, :updated_by_id => current_user.id)
    
    if @comment.has_children?
      @comment.children.each do |child|
        child.update!(:resolved => true, :updated_by_id => current_user.id)
      end
    end
    
    respond_to do |format|
      if @comment.save
        @comment_hash = comment_hash(Comment.where(:spec_id => @comment.spec_id))
        format.html { redirect_to @comment, notice: 'Comment was successfully saved.' }
        format.json { render :show, status: :created, location: @comment }
        format.js   { render :layout => false}
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    
    respond_to do |format|
      if @comment.save
        if @comment.root?
          @comment_hash = @comment.serializable_hash
        else
          @parent_id = @comment.parent_id
          @comment_hash = comment_hash(@comment.siblings)
        end
        format.html { render :new }
        format.json { render :new }
        format.js {render :layout => false}
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :text, :spec_id, :parent_id)
    end
    
    def comment_hash(comment_scope)
      comment_scope.arrange_serializable(:order => 'resolved, created_at')
    end
end
