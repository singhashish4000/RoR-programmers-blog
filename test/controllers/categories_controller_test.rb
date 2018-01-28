require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @category = Category.create(name: 'sports')
    @user = User.create(username: 'John',email: 'jon@example.com',password: 'password',admin: true)
  end  

  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    session[:user_id] = @user.id
    get :new 
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end  

  test "should redirect when admin not logged in" do
      assert_no_difference 'Category.count' do
        post :create, category: { name: 'RoR' }
      end
    assert_redirected_to categories_path        
  end  

end



# here => sign_in_as(@user,"password")
# test_helper.rb => def sign_in_as(user, password)
#                       post login_path, params:{session: {email: user.email, password:password }} 
#                   end    