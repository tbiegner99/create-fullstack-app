set -x
CMD=$1
case $CMD in 
    build)
    COMMAND="up -d --build"
    ;;
    start)
    COMMAND="up -d"
    ;;
    stop)
    COMMAND="down"
    ;;
    remove)
    COMMAND="rm"
    ;;
    install)
    COMMAND="run"
    ;;
    clean)
    COMMAND="run"
    ;;
esac

shift
if [ -z "$@" ]; then
    ARGS=$(find ${{ upper (snake name) }}_HOME/backend -type f -iname "docker-compose.yml" -exec printf ' -f %s ' '{}' +)

    ARGS="-f ${{ upper (snake name) }}_HOME/local-dev/docker-compose.services.yml -f ${{ upper (snake name) }}_HOME/ui/docker-compose.yml $ARGS"

    docker-compose -p {{kebab name}} $ARGS $COMMAND
else 
    ARGS="-f ${{ upper (snake name) }}_HOME/local-dev/docker-compose.services.yml "
    for ALIAS in $@
    do
        SERVICE=$(${{ upper (snake name) }}_HOME/local-dev/scripts/alias.sh $ALIAS)
        
        if [ "$SERVICE" = "{{kebab name}}-ui" ]; then
            COMPOSE_FILE="-f ${{ upper (snake name) }}_HOME/ui/docker-compose.yml"
        else
            COMPOSE_FILE=$(find ${{ upper (snake name) }}_HOME/backend/$SERVICE -type f -iname "docker-compose.yml" -exec printf ' -f %s ' '{}' +)
        fi

       
        if [ ! -z "$COMPOSE_FILE" ]; then
            docker stop $SERVICE 
            docker rm $SERVICE
            ARGS="$COMPOSE_FILE $ARGS"
            if [ "install" = "$CMD" ]; then
                COMMAND="$COMMAND --rm -w /srv/package/cmd $SERVICE go install"
            elif [ "clean" = "$CMD" ]; then
                COMMAND="$COMMAND --rm -w /srv/package $SERVICE go clean -modcache"
            fi
        else 
            echo "NO compose file for service $SERVICE. Ignoring..."
        fi
        
    done
    if [ ! -z "$ARGS" ]; then
        docker-compose  $ARGS -p {{kebab name}} $COMMAND
    fi
fi
