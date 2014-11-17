require 'rails_helper'

include TestFactories
include Devise::TestHelpers

describe User do 

  

  describe '#favorited(post)' do

    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns nil if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorited(@post) ).to eq(favorite)
    end

  end

end
  