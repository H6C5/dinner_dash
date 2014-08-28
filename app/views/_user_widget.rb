<div class="col-md-5 col-md-offset-7">
  <div>
    <div id="the_gravatar"><%= gravatar_for @user %></div>

    <p class="hello_customer xxl_hello"><%= "Hi #{current_user.first_name}!" %></p>
    <p class="hello_customer l_hello push_up"><%= "Welcome back!" %></p>
    <p class="hello_companion"> <%= "There are #{ @cart.total_items } booze ice creams waiting for you!" %></p>

    <%= link_to cart_path(@cart), class: "btn btn-success full top_hello", id: "hello_customer" do  %>
      Complete your Order <span class="glyphicon glyphicon-shopping-cart"></span>
    <% end %>
  </div>
</div>
