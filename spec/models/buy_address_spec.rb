require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy = FactoryBot.build(:buy_address)
  end

  describe '購入機能の実装' do
    context '購入がうまくいく場合' do
      it 'token,postal_code,prefecture,city,address,phone_numberがあれば購入できる'do
      @buy.valid?
      expect(@buy).to be_valid
      end
      it 'buildingがなくても購入できる'do
      @buy.building = ""
      @buy.valid?
      expect(@buy).to be_valid
      end
      it '郵便番号が上３桁、下４桁の半角数字が-で繋がている形で入力されていれば購入できる'do
      @buy.postal_code = "661-2233"
      @buy.valid?
      expect(@buy).to be_valid
      end
      it '都道府県は "--" 以外を選択していれば購入できる'do
      @buy.prefectures = '5'
      @buy.valid?
      expect(@buy).to be_valid
      end
      it '電話番号は-なしの10~11桁の数字であれば購入できる'do
      @buy.phone_number = '09011112223'
      @buy.valid?
      expect(@buy).to be_valid
      end

    end
    context '購入がうまくいかない場合' do
      it 'tokenがないと購入できない'do
      @buy.token = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がないと購入できない'do
      @buy.postal_code = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県は"--"が選択されていると購入できない'do
      @buy.prefectures = "0"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefectures is not choosen")
      end
      it '郵便番号に-がなければ購入できない'do
      @buy.postal_code = "6610988"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が上３桁、下４桁でなければ購入できない'do
      @buy.postal_code = "9999-999"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が半角数字意外だと購入できない'do
      @buy.postal_code = "０９０-８８あA"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '市区町村の入力がなければ購入できない'do
      @buy.city = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("City can't be blank")
      end
      it '電話番号がなければ購入できない'do
      @buy.phone_number = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に-があると購入できない'do
      @buy.phone_number = "090-9899-0987"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が半角数字以外だと購入できない'do
      @buy.phone_number = "０９０３８７２っy２２"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11桁より多いと購入できない'do
      @buy.phone_number = "090989887777"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が10桁より少ないと購入できない'do
      @buy.phone_number = "090090909"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
      end   
    end
  end
end
