require 'swagger_helper'

describe 'Fedaby API' do
  path '/profile/{id}' do
    get 'Get a profile' do
      tags 'Profile'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Profile found' do
        let(:id) { User.create(email: "bian#{rand(100)}@hotmail.com",
        password: '123456').id }
        it "returns expected response" do
          user = JSON.parse(User.first.to_json)
          expect(JSON.parse(response.body))
          eq({"created_at"=>user["created_at"], "id"=> user["id"], "username"=>user["username"]})
        end
        run_test!
      end
      response '404', 'Profile not foud' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/autocomplete_profile' do
    get 'Search a profile by username' do
      tags 'Profile'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :content, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string }
        }
      }
      response '200', 'Profile/Profiles find' do
        let(:content) { { content: 'test' } }
        run_test!
      end

      response '204', 'Profile/Profiles not found' do
        let(:content) { { test: '' } }
        run_test!
      end
    end
  end

  path '/autocomplete_profile' do
    post 'Follow a user' do
      tags 'Profile'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
    end
  end
end