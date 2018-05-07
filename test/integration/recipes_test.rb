require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
  def setup 
    @chef = Chef.create!(chefname:"mashrur", email:"mashrur@example.com")
    @recipe = @chef.recipes.build(name:"chicken saute", description:"boil in pot with m&m's")
    @recipe.save
    @recipe2 = @chef.recipes.build(name:"baked ziti", description:"make pasta add sauce and cheese and bake")
    @recipe2.save
  end
  
  
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end
  
  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
  
end
