<<<<<<< HEAD
# test/application_system_test_case.rb
require "test_helper"
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome # Update this line
=======
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
>>>>>>> origin/master
end
