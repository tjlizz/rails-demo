
require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  post "/users" do
    parameter :email,type: :string
    parameter :password ,type: :string
    parameter :password_confirmation ,type: :string
    example "创建用户1" do
      do_request(email:'1@qq.com',password:'123456',password_confirmation:'123456')
      expect(status).to eq 200
    end
  end
end