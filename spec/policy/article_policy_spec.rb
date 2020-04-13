require 'rails_helper'
RSpec.describe ArticlePolicy do
  let(:article) { create :article, author: author }
  let(:author)  { create :user }

  context 'when nil user' do
    let(:current_user) { nil }

    it { expect(current_user.dude).not_to be_able_to_update_article(article) }
    it { expect(current_user.dude).not_to be_able_to_delete_article(article) }
  end

  context 'when regular_user' do
    let(:current_user) { create :user }

    it { expect(current_user.dude).not_to be_able_to_update_article(article) }
    it { expect(current_user.dude).not_to be_able_to_delete_article(article) }

    context ' is author of article' do
      let(:author) { current_user }
      it { expect(current_user.dude).to be_able_to_update_article(article) }
      it { expect(current_user.dude).to be_able_to_delete_article(article) }
    end
  end

  context 'when admin' do
    let(:current_user) { create :user, admin: true }
    it { expect(current_user.dude).to be_able_to_update_article(article) }
    it { expect(current_user.dude).not_to be_able_to_delete_article(article) }

    context ' is author of article' do
      let(:author) { current_user }
      it { expect(current_user.dude).to be_able_to_update_article(article) }
      it { expect(current_user.dude).to be_able_to_update_article(article) }
    end
  end
end
