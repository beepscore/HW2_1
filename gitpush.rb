# ruby script copyright Beepscore LLC 2010
# To use:
#   cd <project directory>
#   ruby gitpush.rb
#
# References:
# http://linux-certification.blogspot.com/2008/10/using-shell-commands-in-ruby.html

system "git checkout dev"
system "git push origin dev"
system "git checkout master"
system "git merge dev"
system "git push origin master"
system "git checkout dev"
