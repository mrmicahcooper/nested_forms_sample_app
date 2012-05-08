#Nested Form Example App

A healthy example for implementing a nested form with Ruby on Rails

##Install

If you want to play with this on your local machine. Follow the instructions below:
```
$ git clone git@github.com:mrmicahcooper/nested_forms_sample_app.git
```

cd into the project. 
**Note:** If you're using RVM, (which you should be) enter 'yes' into the console to allow the new .rvrmrc file to load.
This will create a gemset for you.
```
$ cd path/to/project
```

Bundle
```
$ bundle install
```

Create the database on your local machine and run the migration:
```
$ rake db:create && rake db:migrate
```

Boot up the development server with:
```
$ rails server thin
```

Nice. Now this should be running locally.


