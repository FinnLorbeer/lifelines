require 'fileutils'

class Setup

  def initialize
    FileUtils.mkdir_p(File.expand_path("../../../screenshots", __FILE__))
    initate_browser
    set_timeout
    set_browser_size
    $b
  end

  private

  def initate_browser
    case $browser
      when 'chrome'
        $b = Watir::Browser.new :chrome
      when 'firefox'
        $b = Watir::Browser.new :firefox
      when 'headless'
        start_headless
      else
        raise "no browser '#{$browser}' defined"
    end
  end

  def set_timeout
    Watir.default_timeout = 180
    $b.driver.manage.timeouts.implicit_wait = 5
  end

  def set_browser_size
    $b.driver.manage.window.move_to(0, 0)
    width = $b.execute_script('return screen.width;')
    height = $b.execute_script('return screen.height;')
    resize_view(width, height)
  end

  def start_headless
    $headless = Headless.new
    $headless.start
    $b = Watir::Browser.start 'florbeer.marsair.tw'
  end

  def resize_view(width, height)
    $b.driver.manage.window.resize_to(width, height)
  end

end