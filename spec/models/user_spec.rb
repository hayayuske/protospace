require 'rails_helper'

describe User do
  describe '#create' do

    context 'with valid attributes' do
      it "is valid with all information" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'without valid attributes' do
      it "is invalid without a nickname" do
        user = build(:user, username: "")
        user.valid?
        expect(user.errors[:username]).to include("can't be blank")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "is invalid with a password that has less than 5 characters " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
    end

  end
end
