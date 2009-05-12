require 'test_helper'

class CongressmenTest < Test::Unit::TestCase
  should "probably rename this file and start testing for real" do
    receiver = Congressmen(File.dirname(__FILE__) + "/pdfs/PL_184.pdf")
  end
end
