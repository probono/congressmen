require 'test_helper'

class CongressmenTest < Test::Unit::TestCase
  should "probably rename this file and start testing for real" do
    record = Congressmen(File.dirname(__FILE__) + "/pdfs/L9/PL_081.pdf")
    puts record.actors
  end
end
