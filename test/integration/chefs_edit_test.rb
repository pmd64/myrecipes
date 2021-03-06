require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname:"clyde", email:"clyde@dog.com", password:"password", password_confirmation:"password")
  end
  
  test "reject an invalid edit" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {  chefname: " ", email: "clyde@dog.com" } }    
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
    
  end
  
  test "accept a valid signup" do
    sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: { chef: {  chefname: "clyde1", email: "clyde1@dog.com" } }    
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "clyde1", @chef.chefname
    assert_match "clyde1@dog.com", @chef.email    
  end
end
