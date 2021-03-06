class Teardown

  def initialize
    save_screenshot
    close_browser
    if $headless
      $headless.destroy
      sleep 5 #to prevent xvfb freezing
    end
  end

  private

  def save_screenshot
    begin
      $browser.screenshot.save( File.expand_path("./screenshots/#{$test_name}.png") )
    rescue
      puts 'taking screenshot failed.'
    end
  end

  def close_browser
    begin #Timeout::Error
      Timeout::timeout(10) { $browser.close }
    rescue Timeout::Error
      browser_pid = $browser.driver.instance_variable_get(:@bridge).instance_variable_get(:@service).instance_variable_get(:@process).pid
      ::Process.kill('KILL', browser_pid)
      sleep 1
    end
  end

end
