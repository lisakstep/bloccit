require 'rails_helper'

describe User do 

  include TestFactories
  include Devise::TestHelpers

  describe '#favorited(post)' do

    before do
      @user = authenticated_user
      @post = associated_post
      sign_in @user
    end

    xit "returns nil if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
    end

    xit "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorited(@post) ).to eq(favorite)
    end

  end

end
  