require 'test_helper'

class SessionFlowsTest < ActionDispatch::IntegrationTest
  test 'unauthorized user will be redirected to login page' do
    get root_url
    assert_redirected_to controller: :sessions, action: :login
  end

  test 'user with incorrect credentials will be redirected to login page' do
    post sessions_create_url, params: { username: Faker::Lorem.word, password: Faker::Lorem.word }
    assert_redirected_to controller: :sessions, action: :login
  end

  test 'user with correct credentials will see the root' do
    password = Faker::Lorem.word

    user = User.create(username: Faker::Lorem.word, password: password, password_confirmation: password)

    post sessions_create_url, params: { username: user.username, password: password }

    assert_redirected_to controller: :index, action: :input
  end

  test 'user will see the root after signing up' do
    username = Faker::Lorem.word
    password = Faker::Lorem.word

    post users_url, params: { user: { username: username, password: password, password_confirmation: password } }

    assert_redirected_to controller: :index, action: :input
  end

  test 'user can logout' do
    password = Faker::Lorem.word

    user = User.create(username: Faker::Lorem.word, password: password, password_confirmation: password)

    post sessions_create_url, params: { login: user.username, password: password }

    get sessions_logout_url

    assert_redirected_to controller: :sessions, action: :login
  end
end
