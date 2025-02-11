#mkdir -p ${{ upper (snake name) }}_HOME/local-dev/postgres-data
docker-compose -p {{ kebab name }} -f ${{ upper (snake name) }}_HOME/local-dev/docker-compose.infra.yml up -d
${{ upper (snake name) }}_HOME/local-dev/scripts/services/service-command.sh start $@
