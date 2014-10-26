module Test
  module Unit
    class TestSuite
      alias :old_run :run
      def run(result, &progress_block)
        old_run(result, &progress_block)
        File.open('log/errors.log', 'w') { |f|
          result.faults.each { |err|
            case err
              when Test::Unit::Error, Test::Unit::Failure
                f << err.test_name + '+arg ' + $all_arg
                f << "\n"
              when Test::Unit::Pending, Test::Unit::Notification, Test::Unit::Omission
            end
          }
        }
        File.open('log/backtrace.log', 'w') { |f|
          result.faults.each { |err|
            case err
              when Test::Unit::Error, Test::Unit::Failure
                err.long_display.each_line do |line|
                  unless (line['/gems/']) || (line['lib/setup/'])
                    f << line
                  end
                end
                f << "\n"
            end
          }
        }
      end
    end
  end
end

def store_method_name
  begin
    caller[0]=~/`(.*?)'/ #`
    $1
    $test_name = $1
    puts "" ,"testing #{$test_name} now"
  rescue => e
    puts "read error in method name"
  end
end