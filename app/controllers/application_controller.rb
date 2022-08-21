class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/bakeries' do
    "Hello World"
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end
  get '/baked_goods_by_price' do
    bakedgoods = BakedGood.all.order(price: :desc)
    bakedgoods.to_json
  end
  get '/baked_goods/most_expensive' do
    bakedgoods = BakedGood.all.order(price: :desc)[0]
    bakedgoods.to_json
  end
end
