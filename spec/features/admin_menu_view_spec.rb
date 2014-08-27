require 'feature_helper'

describe "admin_menu", type: :feature do
  before(:each) do

    @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
                        first_name: "admin", last_name: "whatever", role: "admin")

    category1 = Category.create(title:"Chocolate", description:"Who doesn't like chocolate? Hilter that's who.")
    category2 = Category.create(title:"Vanilla", description: "It's not as boring as white people")
    category3 = Category.create(title:"Strawberry", description: "This counts as a fruit right?")

    @categories = Category.all
    @category   = Category.first

    item1 =Item.create(title:"Chocolate yummy yumm", description: "Chocolate so good you'll wanna slap yo mama", price: 400, image: "icecreamslug.com", status: 1)
    item2 =Item.create(title:"Vanilla willya please", description: "Vanilla is the bomb for you mom!", price: 325, image: "icecreamslug.com", status: 1)
    item3 =Item.create(title:"Strawberry berry tasty", description: "Strawbeeeeeerrrry! Is good for me!", price: 450, image: "icecreamslug.com", status: 1)

    @items = Item.all
    @item  = Item.first

    category1.items << item1
    category2.items << item2
    category3.items << item3


    visit home_path
  end

  it "shows the items to an admin" do
    admin_login
    @items.each do |item|
      visit administrator_items_path

      expect(current_path).to eq(administrator_items_path)
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.description)
      expect(page).to have_content(item.price)
      # expect(page).to have_image(item.image) come back to this...
    end
  end

  it 'has a links to edit the items' do
    admin_login
    visit administrator_items_path
    @items.each do |item|
      expect(page).to have_link('Edit', href: edit_administrator_item_path(item))
    end
  end

  it 'edits an item' do
    admin_login
    visit administrator_items_path
    item     = @items.first
    old_item = item.title

    within('//table') do
      first(:link, 'Edit').click
    end
    page.fill_in('Title', with: 'Chocolate Monkey Madness')
    page.click_button('Submit')

    expect(current_path).to eq(administrator_items_path)
    expect(page).to have_content('Chocolate Monkey Madness')
    expect(page).to_not have_content(old_item)
  end

  it 'has a link to add an item' do
    admin_login
    visit administrator_items_path
    expect(page).to have_link('Create New Item', href: new_administrator_item_path)
  end

  it 'creates a new item' do
    admin_login
    visit administrator_items_path
    page.click_link('Create New Item')

    page.fill_in('Title', with: 'Bananaramma you full of goodness')
    page.fill_in('Description', with: "Don't be so dirty! It's just bananas and cream")
    page.fill_in('Price', with: '450')
    select('Strawberry', :from => 'Categories')

    page.click_button('Submit')

    expect(current_path).to eq(administrator_items_path)
    expect(page).to have_content('Bananaramma you full of goodness')
    expect(page).to have_content('Strawberry')
  end

  it 'has a links to delete the items' do
    admin_login
    visit administrator_items_path
    @items.each do |item|
      expect(page).to have_link('Delete', href: administrator_item_path(item))
    end
  end

  it 'deletes an item' do
    admin_login
    visit administrator_items_path
    item         = @items.first
    deleted_item = item.title

    within("//table") do
      first(:link, 'Delete').click
    end

    expect(current_path).to eq(administrator_items_path)
    expect(page).to_not have_content(deleted_item)
  end

  it 'has a select menu to change the status of the item' do
      admin_login
      visit administrator_items_path
      page.has_css?('table tr td form select.status')
  end

  it 'changes the status of an item and the item dissapears from the user menu' do
    admin_login
    visit administrator_items_path
    item         = @items.first
    retired_item = item.title

    visit items_path
    expect(page).to have_content(item.title)

    visit administrator_items_path
    within('//table') do
      first(:link, 'Edit').click
    end
    select('Retired', from: 'Status')
    click_button('Submit')

    visit items_path
    expect(page).to_not have_content(retired_item)
  end
end
