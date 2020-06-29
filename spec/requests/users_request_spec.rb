require 'rails_helper'

RSpec.describe "Users", type: :request do

  it "创建用户" do
    post '/users', params: {email: ''}
    expect(response.status).to eq 422
    body = JSON.parse(response.body)
    expect(body["errors"]["email"][0]).to eq '邮箱不能为空'
  end

end
