class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def purge_image 
    @article = Article.find(params[:article_id])
    @article.images.purge
    redirect_to root_path, notice: "success"
   end

   def purge_photo
    @article = ActiveStorage::Attachment.find(params[:article_id])
    @article.purge
    redirect_to root_path, notice: "success"
   end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :tag, images: [])
    end
end
