require 'swagger_helper'
describe 'Fedaby API' do
  path '/articles' do
    get 'Get all articles' do
      tags 'Articles'
      consumes 'application/json', 'application/xml'
      produces 'application/json'

      response '200', 'Array with all articles' do
        run_test!
      end
    end

    post 'Create an article' do
      tags 'Articles'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string },
          image: { type: :string },
          vote: { type: :integer },
          user_id: { type: :integer }
        },
        required: [ 'title', 'content', 'image', 'vote', 'user_id' ]
      }

      response '201', 'Article created' do
        let(:article) {
          { title: 'test', content: 'test', image: 'test',
            user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
            password: '123456').id }
        }
        run_test!
      end

      response '400', 'invalid request' do
        let(:article) { { user_id: 'invalid' } }
        run_test!
      end
    end
  end

  path '/articles/{id}' do
    get 'Get an article' do
      tags 'Articles'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'article found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            content: { type: :string },
            image: { type: :string },
            vote: { type: :integer },
            user_id: { type: :integer }
          },
          required: [ 'id', 'title', 'content', 'image', 'vote', 'user_id' ]
        let(:id) {
                    Article.create(title: 'test', content: 'test',
                                    image: 'test', user_id:
                                    User.create(email: 'bian2510@hotmail.com',
                                    password: '123456').id).id
                  }
        run_test!
      end

      response '404', 'article not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Edit an article' do
      tags 'Articles'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string },
          image: { type: :string },
          vote: { type: :integer },
          user_id: { type: :integer }
        }
      }
      response '200', 'Edit succesfull' do
        let(:id) { 
            Article.create(title: 'test', content: 'test',
            image: 'test', user_id:
            User.create(email: 'bian2510@hotmail.com',
            password: '123456').id).id
          }
        let(:article) { { title: 'string' } }
        run_test!
      end

      response '400', "The article can't edit" do
        let(:id) { 
            Article.create(title: 'test', content: 'test',
            image: 'test', user_id:
            User.create(email: 'bian2510@hotmail.com',
            password: '123456').id).id
          }
        let(:article) { { user_id: 'string' } }
        run_test!
      end
    end

    delete 'Delete an article' do
      tags 'Articles'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '204', 'Article has been delete' do
        let(:id) { 
          Article.create(title: 'test', content: 'test',
          image: 'test', user_id:
          User.create(email: 'bian2510@hotmail.com',
          password: '123456').id).id
        }
        run_test!
      end

      response '404', 'Article not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/autocomplete_by_title' do
    get 'find articles by title' do
      tags 'Articles'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :content, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string }
        }
      }
      response '200', 'Article/Articles find' do
        let(:content) { { content: 'title' } }
        run_test!
      end

      response '400', 'Article/Articles not found' do
        let(:content) { { test: '' } }
      end
    end
  end
end
