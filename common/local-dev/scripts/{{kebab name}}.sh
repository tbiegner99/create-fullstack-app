#!/bin/bash

case $1 in 
    pull-device-db | pddb)
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/utils/pull-device-db.sh $@
        ;;
    alias)
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/alias.sh $@
        ;;
     sh)
        shift
        SERVICE=$(${{ upper (snake name) }}_HOME/local-dev/scripts/alias.sh $1)
        shift
        docker exec -it $SERVICE sh
        ;;

     exec | e)
        shift
        SERVICE=$(${{ upper (snake name) }}_HOME/local-dev/scripts/alias.sh $1)
        shift
        docker exec -it $SERVICE $@
        ;;
    clean-install | ci)
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/services/install.sh clean $@
        ;;
    install | ci)
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/services/install.sh $@
        ;;
    logs | l) 
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/utils/log.sh $@
    ;;
    start | s)
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/services/start.sh $@
    ;;
    stop | x)
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/services/stop.sh $@
    ;;
    rebuild | rb)
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/services/rebuild.sh $@
    ;;

    db-reset | reset-db | dbr)
        shift;
        ${{ upper (snake name) }}_HOME/local-dev/scripts/setup/reset-db.sh $@
        ;;
    db-migrate | migrate-db | dbm)
        ${{ upper (snake name) }}_HOME/local-dev/scripts/setup/update-db.sh
        ;;
    db-update | dbu)
        ${{ upper (snake name) }}_HOME/local-dev/scripts/setup/update-db.sh
        ;;

    generate-changeset | dbcs | gcs)
        shift;
        ${{ upper (snake name) }}_HOME/local-dev/scripts/utils/generate-changeset.sh $@
        ;;

    restart | r) 
        shift
        ${{ upper (snake name) }}_HOME/local-dev/scripts/services/restart.sh $@
    ;;
esac