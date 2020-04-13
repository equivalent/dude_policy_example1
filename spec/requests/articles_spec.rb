require 'rails_helper'
RSpec.describe "Articles", type: :request do
  let(:article) { create :article }

  describe "GET /articles" do
    it "no login required" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe "put /articles/xxxx" do
    def trigger_update
      if current_user
        # devise login
        sign_in current_user 

        # policies are tested with `spec/policy/article_spec.rb so we can stub
        allow(current_user.dude)
          .to receive(:able_to_update_article?)
          .with(article)
          .and_return(authorized)
      end

      put article_path(article), params: {format: :html, article: { title: 'cat' }}
      article.reload
    end

    context 'when not authenticated' do
      let(:current_user) { nil }

      it { expect { trigger_update }.not_to change { article.title } }
      it do
        trigger_update
        expect(response.status).to eq 302 # redirect by update
        follow_redirect!
        expect(response.body).to include('You need to sign in or sign up before continuing.')
      end
    end

    context 'when authenticated' do
      let(:current_user) { create :user }
      
      context 'when not authorized' do
        let(:authorized) { false }

        it { expect { trigger_update }.not_to change { article.title } }
        it do
          trigger_update
          expect(response.status).to eq 302 # redirect to root_path by `authenticate!` method is ApplicationController
          follow_redirect!
          expect(response.body).to include('Sorry current user is not authorized to perform this action')
        end
      end

      context 'when authorized' do
        let(:authorized) { true }

        it { expect { trigger_update }.to change { article.title }.from('interesting article').to('cat') }
        it do
          trigger_update
          expect(response.status).to eq 302
          follow_redirect!
          expect(response.body).to include('Article was successfully updated.')
        end
      end
    end
  end
end
