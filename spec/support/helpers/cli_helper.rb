require 'open3'

module CliHelper
  def run_command(command, *arguments)
    stdin, stdout, stderr = Open3.popen3(command, *arguments)
    [
      stdout.readlines.join('').chomp,
      stderr.readlines.join('').chomp
    ]
  end
end
