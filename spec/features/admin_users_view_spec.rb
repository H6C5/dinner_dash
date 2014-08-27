require 'feature_helper'

describe "admin_user_dashboard", type: :feature do
  before(:each) do

    User.create(email: "duck@example.com", password: "userpassword",
                password_confirmation: "userpassword", first_name: "Duck",
                last_name: "Dogers", role: "default", street: "1510 Blake st.",
                city: "Denver", state: "CO", zipcode: "80123")
    User.create(email: "roger@example.com", password: "userpassword",
                password_confirmation: "userpassword", first_name: "Roger",
                last_name: "Doger", role: "default", street: "1511 Blake st.",
                city: "Denver", state: "CO", zipcode: "80123")

    @users = User.all
    @user  = User.first

    @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
                        first_name: "admin", last_name: "whatever", role: "admin")

    visit home_path
  end

  it 'shows the view to an admin' do
    admin_login
    visit administrator_users_path
    expect(current_path).to eq(administrator_users_path)

    @users.each do |user|
      expect(page).to have_content(user.id)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.role)
      expect(page).to have_link('Profile', href: administrator_address_path(user))
    end
  end

  it 'has links to other dashboards' do
    admin_login
    visit administrator_admins_path
    save_and_open_page
    expect(page).to have_link('Manage Items', href: administrator_items_path)
    expect(page).to have_link('Manage Categories', href: administrator_categories_path)
    expect(page).to have_link('Manage Orders',     href: administrator_orders_path)
  end

  it 'can find a users address' do
    admin_login
    visit administrator_users_path
    within('//table') do
      first(:link, 'Profile').click
    end
    expect(current_path).to eq(administrator_address_path(@user))

    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.last_name)
    expect(page).to have_content(@user.street)
    expect(page).to have_content(@user.city)
    expect(page).to have_content(@user.state)
    expect(page).to have_content(@user.zipcode)

    expect(page).to have_link('Dashboard Home',       href: administrator_admins_path)
    expect(page).to have_link('Users Dashboard',      href: administrator_users_path)
    expect(page).to have_link('Menu Items Dashboard', href: administrator_items_path)
    expect(page).to have_link('Categories Dashboard', href: administrator_categories_path)
    expect(page).to have_link('Orders Dashboard',     href: administrator_orders_path)
  end
end
