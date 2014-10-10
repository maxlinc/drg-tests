module Polytrix
  module Executors
    class WindowsChallengeRunner < ChallengeRunner
      PS_OPTIONS = '-NoProfile -ExecutionPolicy Bypass'

      def challenge_command(challenge_script, basedir = Dir.pwd)
        # I don't know a simple powershell replacement for &&
        # See http://stackoverflow.com/questions/2416662/what-are-the-powershell-equivalent-of-bashs-and-operators
        if File.exist? 'scripts/wrapper.ps1'
          command = "./scripts/wrapper.ps1 #{challenge_script}"
        else
          command = "./#{challenge_script}"
        end
        "PowerShell #{PS_OPTIONS} -Command \"#{command}\""
      end
    end
  end
end