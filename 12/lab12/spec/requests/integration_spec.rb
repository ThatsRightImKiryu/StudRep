# require 'rails_helper'
# require 'spec_helper'

# RSpec.describe 'Static content', type: :system do
#   scenario 'Register, login, calculate' do
#     visit new_user_path
#     fill_in :user_username, with: 'Lololoshka'
#     fill_in :user_password, with: 'ILoveMinecraft'
#     fill_in :user_password_confirmation, with: 'ILoveMinecraft'

#     find('#submit-btn').click
#     expect(current_path).to eq root_path
#     visit session_login_path
#     fill_in :username, with: 'Lololoshka'
#     fill_in :password, with: 'ILoveMinecraft'
#     find('#submit-btn').click

#     fill_in :inpt, with: 15
#     find('#submit-btn').click
#     expect(current_path).to eq '/index/output'

#     expect(find('#result')).to have_text("Числа близнецы\n17 19")
#   end

#   def to_path(path)
#     visit path
#     expect(current_path).to eq session_login_path
#   end

#   scenario 'Check without register' do
#     User.create(username: 'NotHim', password_digest: 'Pass')
#     routes = ['/users/1', '/users/1/edit', '/index/output', root_path, '/users']
#     routes.each do |path|
#       to_path(path)
#     end
#   end
# end

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  describe 'GET ' do
    context 'Should return' do
      before do
        User.create(username: 'rfr', password: '22')
      end

      scenario 'success while registration' do
        visit new_user_path
        fill_in :user_username, with: '1'
        fill_in :user_password, with: '22'
        fill_in :user_password_confirmation, with: '22'

        find('#submit-btn').click
        sleep(0.1)
        expect(current_path).to eq root_path
      end

      scenario 'results after success login' do
        visit session_login_path
        fill_in :username, with: 'rfr'
        fill_in :password, with: '22'
        find('#submit-btn').click
        fill_in :inpt, with: 15
        find('#submit-btn').click
        sleep(0.1)
        expect(current_path).to eq '/index/output'
        expect(find('#result')).to have_text("Числа близнецы\n17 19")
      end
    end

    scenario 'shouldn`t redirect without auth' do
      routes = ['/users/1', '/users/1/edit', '/index/output', root_path, '/users']
      routes.each do |route|
        visit route
        expect(current_path).to eq session_login_path
      end
    end
  end
end
