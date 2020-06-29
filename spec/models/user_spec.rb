require 'rails_helper'

RSpec.describe User, type: :model do

  it "可以带秘密创建" do
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect(user.password_digest).to_not eq '123456'
    expect(user.id).to be_a Numeric
  end
  it "可以删除 user" do
    user = User.create email: '1@qq.com', password: '123456', password_confirmation: '123456'
    expect {
      User.destroy_by id: user.id
    }.to change { User.count }.from(1).to(0)
  end

  it '创建的时候必须有emial ' do
    user = User.create password: '123456', password_confirmation: '123456'
    expect(user.errors.details[:email][0][:error]).to eq(:blank)
  end
  it "创建的时候email不能被占用" do
    user = User.create! password: '123456', password_confirmation: '123456', email: '1@qq.com'
    user = User.create password: '123456', password_confirmation: '123456', email: '1@qq.com'
    expect {
      expect(user.errors.details[:email][0][:error]).to eq(:taken)
    }
  end
  it '创建之后发邮件给用户' do
    x = spy('send')
    allow(UserMailer).to receive(:welcome_email).and_return(x)
    user = User.create password: '123456', password_confirmation: '123456', email: '1@qq.com'
    expect(UserMailer).to have_received(:welcome_email)
    expect(x).to have_received(:deliver_later)
  end
  it '邮箱为空时只提示为空 ' do
    user = User.create email: ''
    expect(user.errors.details[:email].length == 1).to be true
    expect(user.errors.details[:email][0][:error]).to eq  :blank

  end
end
