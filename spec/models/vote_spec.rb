describe Vote do 
  describe "validations" do


    before do
      @post = Post.create(title: 'post title', body: 'post body')
      @post.votes.create(value: 1)
      @post.votes.create(value: -1)
      @post.votes.create(value: 0)
      @post.votes.create(value: 5)
      @post.votes.create(value: -5)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @post.votes.count ).to eq(2)
      end
    end

  end
end