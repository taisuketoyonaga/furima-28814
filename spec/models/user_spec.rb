require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do

      it 'nickname,email,passeword,password_confrimation,family_name,first_name,family_name_reading,first_name_reading,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに＠が含まれていれば登録できる' do
        @user.email = "qqq@000"
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録できる' do
        @user.password = "aaa1111"
        @user.password_confirmation = "aaa1111"
        @user.valid?
        expect(@user).to be_valid
      end
      it 'passwordが英数字混合あれば登録できる' do
      end
      it 'family_nameが全角であれば登録できる' do
       @user.family_name = "とよなが"
       @user.valid?
       expect(@user).to be_valid
      end

      it 'first_nameが全角であれば登録できる' do
        @user.first_name = "たいすけ"
        @user.valid?
       expect(@user).to be_valid
      end
      it 'family_name_readingが全角カタカナであれば登録できる' do
        @user.family_name_reading = "トヨナガ"
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_name_readingが全角カタカナであれば登録できる' do
        @user.first_name_reading = "タイスケ"
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do

      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailに＠が含まれていないと登録できない' do
        @user.email = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複するemailが存在すると登録できない' do
        @user.save
        another_email = FactoryBot.build(:user)
        another_email.email = @user.email
        another_email.valid?
        expect(another_email.errors.full_messages).to include("Email has already been taken") 
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = "aa11"
        @user.password_confirmation = "aa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英字のみの場合登録できない' do
        @user.password = "aaaaaaa"
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end
      it 'passwordが数字のみの場合は登録できない' do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password include both letters and numbers")
      end
      it 'passwordが存在してもPassword_confrimationが空では登録できない' do
        @user.password = "aaaa1111"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが半角だと登録できない' do
        @user.family_name = "ﾀｲｽｹ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = "ﾀｲｽｹ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'family_name_readingが空だと登録できない' do
        @user.family_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      it 'family_name_readingが全角カタカナ以外だと登録できない' do
        @user.family_name_reading = "aあｱ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading Full-width katakana characters")
      end
      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'first_name_readingが全角カタカナ以外だと登録できない' do
        @user.first_name_reading = "aあｱ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end