#! /bin/bash

docker run -e PGPASSWORD={{kebab name}} --network={{kebab name}}-local-dev --rm jbergknoff/postgresql-client  psql -h {{kebab name}}-db -d {{kebab name}} -U {{kebab name}} -p 5432 -c "DROP SCHEMA \"{{kebab name}}\" CASCADE; "

if [[ $1 = "--disable-seed" ]]
then
  docker run -e PGPASSWORD={{kebab name}} --network={{kebab name}}-local-dev --rm jbergknoff/postgresql-client psql -h {{kebab name}}-db -d {{kebab name}} -U {{kebab name}} -p 5432 -c "CREATE SCHEMA \"{{kebab name}}\";"
else
  docker run -v ${{ upper (snake name) }}_HOME/local-dev/scripts/seed:/seed -e PGPASSWORD={{kebab name}} --network={{kebab name}}-local-dev --rm jbergknoff/postgresql-client  psql -h {{kebab name}}-db -d {{kebab name}} -U {{kebab name}} -p 5432 -f "/seed/dump-{{kebab name}}.sql"
fi

docker run -e PGPASSWORD={{kebab name}} --network={{kebab name}}-local-dev --rm jbergknoff/postgresql-client  psql -h {{kebab name}}-db -d {{kebab name}} -U {{kebab name}} -p 5432 -c "ALTER SCHEMA public RENAME TO \"{{kebab name}}\"; "
docker run -v ${{ upper (snake name) }}_HOME/database/{{kebab name}}:/liquibase/lib --network={{kebab name}}-local-dev liquibase/liquibase liquibase update  --username={{kebab name}} --password={{kebab name}} --url=jdbc:postgresql://{{kebab name}}-db:5432/{{kebab name}} --changelogFile=changelog-root.xml


docker run -v ${{ upper (snake name) }}_HOME/local-dev/scripts/seed:/seed -e PGPASSWORD={{kebab name}} --network={{kebab name}}-local-dev --rm jbergknoff/postgresql-client  psql -h {{kebab name}}-db -d {{kebab name}} -U {{kebab name}} -p 5432 -f "/seed/{{kebab name}}.sql"
