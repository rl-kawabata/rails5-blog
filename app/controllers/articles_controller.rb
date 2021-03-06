class ArticlesController < AdminApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: '記事が作成されました'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: '記事が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: '記事が削除されました'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
end
