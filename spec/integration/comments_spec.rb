require 'swagger_helper'
describe 'Fedaby API' do
  path '/articles/{article_id}/comments' do
    get 'Get all comments of an article' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :article_id, in: :path, type: :string
      response '200', 'Return an array with all comments of that article' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
       run_test!
      end

      response '404', 'Article not found' do
        let(:article_id) { 'invalid' }
        run_test!
      end
    end

    post 'Create a comment for an article' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :article_id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          article_id: { type: :integer },
          body: { type: :string },
          vote: { type: :integer }
        },
        required: ['user_id', 'article_id', 'body']
      }

      response '201', 'Comment created' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:comment) { Comment.create(user_id: User.last.id, article_id: Article.last.id, body: 'test') }
        run_test!
      end

      response '400', 'invalid request' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:comment) { { article_id: 'invalid' } }
        run_test!
      end
    end
  end

  path '/articles/{article_id}/comments/{id}' do
    get 'Show a comment of an article' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :article_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      response '200', 'comment found' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:id) { Comment.create(user_id: User.last.id, article_id: Article.last.id, body: 'test').id }
        run_test!
      end

      response '404', 'comment not fount' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:id) { 'invalid' }
      end
    end

    put 'Edit a comment of an article' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :article_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :body,
        properties: {
          user_id: { type: :integer },
          article_id: { type: :integer },
          body: { type: :string },
          vote: { type: :integer }
        },
        required: ['body']
      }
      response '200', 'Edit sucefull' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:id) { Comment.create(user_id: User.last.id, article_id: Article.last.id, body: 'test').id }
        let(:comment) { { body: 'change' } }
        run_test!
      end

      response '400', "The article can't edit" do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:id) { Comment.create(user_id: User.last.id, article_id: Article.last.id, body: 'test').id }
        let(:comment) { { body: { user: 1 } } }
        run_test!
      end
    end

    delete 'Delete a comment of an article' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :article_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      response '204', 'The comment has been delete' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:id) { Comment.create(user_id: User.last.id, article_id: Article.last.id, body: 'test').id }
        run_test!
      end

      response '404', 'The comment not found' do
        let(:article_id) { Article.create(title: 'test', content: 'test',
          user_id: User.create(email: "bian#{rand(100)}@hotmail.com",
          password: '123456').id).id }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end