require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/sample_image.jpeg')
  end

  describe '商品出品機能' do
    context '商品が登録できる場合' do
      it 'image,name,explain,category_id,status_id, delivery_fee_id,shopping_origin_id,delivery_date_id(idは全て１以外),priceがあれば登録できる ' do
        @item.valid?
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら登録できる' do
        @item.price = '1985'
        expect(@item).to be_valid
      end
      it 'priceが300円以上なら登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9999999円以下なら登録できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない場合' do
      it 'imageがない場合登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがない場合登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explainがない場合登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'delivery_fee_idが1だと登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'shopping_origin_idが1だと登録できない' do
        @item.shopping_origin_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping origin must be other than 1')
      end
      it 'delivery_date_idが1だと登録できない' do
        @item.delivery_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date must be other than 1')
      end
      it 'priceが300円未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000円以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが数字以外だと登録できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
