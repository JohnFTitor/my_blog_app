require 'rails_helper'

RSpec.describe 'Post', type: :model do 
  before :all do 
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    @user = User.create(name: 'name', photo: 'link', bio: 'some')
  end

  subject { Post.new(title: 'title', text: 'text', author: @user) }

  describe 'should implement methods' do
    it 'should return 5 most recent comments' do 
      last_five_comments = []
      (1..10).each do |i| 
        comment = Comment.new(text: "Some comment #{i}", author: @user)
        comment.post = subject
        comment.save

        if i > 5  
          last_five_comments << comment
        end
      end

      recent_comments = subject.recent_comments

      expect(recent_comments.length).to eq(5)
      expect(recent_comments).to eq(last_five_comments.reverse)  
    end
  end

end
