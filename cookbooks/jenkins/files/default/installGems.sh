source /usr/local/rvm/scripts/rvm
gem install cucumber
gem install nokogiri
gem install capybara
gem install selenium-webdriver
cd /var/lib/jenkins/jobs
unzip /var/chef/primefactors.zip
chown -R jenkins:jenkins primefactors
cd /var/lib/jenkins/plugins
cp -r -f /var/chef/jenkins_plugins/* .
chown -R jenkins:jenkins *
cd /var/lib/jenkins
cp /var/chef/credentials.xml .
cp /var/chef/org.jenkinsci.plugins.xvfb.XvfbBuildWrapper.xml .
chown jenkins:jenkins credentials.xml
chown jenkins:jenkins org.jenkinsci.plugins.xvfb.XvfbBuildWrapper.xml
sudo service jenkins restart