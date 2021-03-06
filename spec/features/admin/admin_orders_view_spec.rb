require 'feature_helper'

describe "admin orders", type: :feature do
  before(:each) do

    @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
                        first_name: "admin", last_name: "whatever", role: "admin")

    @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                      first_name: "user", last_name: "whatever", role: "default")
    @order1 = @default_user.orders.create(status: "paid", receiving: "Delivery")
    @order2 = @default_user.orders.create(status: "paid", receiving: "Delivery")
    @order3 = @default_user.orders.create(status: "ordered", receiving: "Delivery")
    @order4 = @default_user.orders.create(status: "ordered", receiving: "Delivery")
    @order5 = @default_user.orders.create(status: "completed", receiving: "Delivery")
    @order6 = @default_user.orders.create(status: "completed", receiving: "Delivery")
    @order7 = @default_user.orders.create(status: "cancelled", receiving: "Delivery")
    @order8 = @default_user.orders.create(status: "cancelled", receiving: "Delivery")
    @orders = Order.all
    visit home_path

  end

  it 'shows a list of orders to the admin' do
    admin_login
    visit administrator_orders_path
    @orders.each do |order|
      expect(page).to have_content(order.user.first_name)
    end
  end

  it 'the admin can view a single order' do
    admin_login
    visit administrator_orders_path
    first(:link, 'Order Details').click
    expect(current_path).to eq(administrator_order_path(@order1))
    expect(page).to have_content(@order1.user.email)
  end

  it 'the admin can delete a single item from an order' do
    @item1 = Item.create(title: "Vanilla", price: 2.00)
    @order_item = @order1.cart_items.create(item_id: 1)
    admin_login
    visit administrator_order_path(@order1)

    click_button("Delete")
    expect(page).to_not have_content(@order_item.item.title)
  end

  it 'the admin can add a quantity to an order' do
    @item1 = Item.create(title: "Vanilla", price: 3.00)
    @order_item = @order1.cart_items.create(item_id: 1)
    admin_login
    visit administrator_order_path(@order1)
    within('div.field') do
      fill_in('cart_item_quantity', :with => 5)
      click_on('save')
    end
    within('tr.total_line') do
      expect(page).to have_content('$15.00')
    end
  end

  it "admin can view all paid orders" do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Paid Orders")
    expect(page).to have_content(@order2.status)
    expect(page).to_not have_content(@order3.status)
  end

  it "admin can view all ordered orders" do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Ordered Orders")
    expect(page).to have_content(@order4.status)
    expect(page).to_not have_content(@order5.status)
  end

  it "admin can view all completed orders" do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Completed Orders")
    expect(page).to have_content(@order6.status)
    expect(page).to_not have_content(@order7.status)
  end

  it "admin can view all cancelled orders" do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Cancelled Orders")
    expect(page).to have_content(@order7.status)
    expect(page).to_not have_content(@order6.status)
  end

  it "admin can cancel a paid order" do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Paid Orders")

    within("//table") do
      first(:link, "Cancel").click
    end

    visit administrator_paid_path
    expect(page).to have_content("Cancel Successful")
    expect(page).to_not have_css("#order-id", text: @order1.id)
    expect(page).to have_css("#order-id", text: @order2.id)


  end

  it 'admin can complete a paid order' do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Paid Orders")

    within("//table") do
      first(:link, "Complete" ).click
    end

    visit administrator_paid_path

    expect(page).to have_content("Successfully marked as Completed")
    expect(page).to_not have_css("#order-id", text: @order1.id)
    expect(page).to have_css("#order-id", text: @order2.id)
  end

  it "admin can cancel an ordered order" do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Ordered Orders")

    within("//table") do
      first(:link, "Cancel").click
    end

    visit administrator_ordered_path

    expect(page).to_not have_css("#order-id", text: @order3.id)
    expect(page).to have_css("#order-id", text: @order4.id)


  end

  it 'admin can complete an ordered order' do
    admin_login
    visit administrator_orders_path
    click_link_or_button("Ordered Orders")

    within("//table") do
      first(:link, "Complete" ).click
    end

    visit administrator_ordered_path
    expect(page).to have_content("Ordered Order")
    expect(page).to_not have_css("#order-id", text: @order3.id)
    expect(page).to have_css("#order-id", text: @order4.id)
  end
end
