class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    # 上の行はインスタンスを作っただけ。saveメソッドで保存しないと、消える。
      @item.save

    # saveの後にshow(商品詳細ページ)に飛ぶ設定をします。
    # これを設定しないと、プログラムが行き場をなくしてエラーが起きます。
    redirect_to @item

    # redirect_to "/items"
    # だとindexページにリダイレクトする
  end

  def edit
    @item = Item.find(params[:id])
  end

    def update
  @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end



  private

  def item_params
    params.require(:item).permit(:name, :price, :seller, :description, :email, :image_url)
  end
end
