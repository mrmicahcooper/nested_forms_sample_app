
namespace :deploy do

  task :production do
    remote = "git@heroku.com:nestedformsampleapp.git"
    app = "nestedformsampleapp"
    system "heroku maintenance:on --app #{app}"
    system "git push -f #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku maintenance:off --app #{app}"
    system 'git checkout master'
  end

end
