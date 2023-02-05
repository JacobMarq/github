require 'simplecov'
require 'coveralls'

SimpleCov.profiles.define 'github_api2' do
  add_filter "/spec/"
  add_filter "/features/"

  add_group 'Repos',   'lib/github_api2/repos'
  add_group 'Orgs',    'lib/github_api2/orgs'
  add_group 'Users',   'lib/github_api2/users'
  add_group 'Issues',  'lib/github_api2/issues'
  add_group 'Events',  'lib/github_api2/events'
  add_group 'Gists',   'lib/github_api2/gists'
  add_group 'Git Data','lib/github_api2/git_data'
  add_group 'Pull Requests','lib/github_api2/pull_requests'
end # SimpleCov
