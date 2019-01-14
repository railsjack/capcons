COLOR="\033[1;31m"
RESET="\033[0;00m"

echo -e "$COLOR Running the Eduleaf Setup Script... this could take a minute... $RESET"

#Returns the options for the setup script
echo -e "$COLOR installing bundle... boom!!!$RESET"
bundle install

echo -e "$COLOR Dropping the database in development environment... boom!!!$RESET"
rake db:drop RAILS_ENV=development	
echo -e "$COLOR Creating shiney new database in development environment... fresh!$RESET"
rake db:create RAILS_ENV=development

echo -e "$COLOR Migrating the database in development environment. Wow, this is fun!$RESET"
rake db:migrate RAILS_ENV=development

echo -e "$COLOR Seeding the database in development environment... it's growing...$RESET"
rake db:seed RAILS_ENV=development
