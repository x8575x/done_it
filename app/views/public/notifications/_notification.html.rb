<% visiter = notification.visiter %>
<% item = notification.item %>

<div class="user-view clearfix ">
  <%= link_to users_user_path(notification.visiter) do %>
    <%= attachment_image_tag visiter, :profile_image, :fill,100,100, format: "jpeg", fallback: "no_image.jpg", size: "50x50", class:"profile-img-circle" %>
  <% end %>
  <%= notification_form(notification) %><span class="moderate-font"><%= " (#{time_ago_in_words(notification.created_at)} 前)" %></span>
  <br>
  <% if !@comment.nil? %>
    <p class="moderate-font text-center" style="color: #C0C0C0;"><%= @comment %></p>
  <% end %>
</div>