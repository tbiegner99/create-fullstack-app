
if [ "$1" = "clean" ]; then
    shift
    ${{ upper (snake name) }}_HOME/local-dev/scripts/services/service-command.sh clean $@
fi
${{ upper (snake name) }}_HOME/local-dev/scripts/services/service-command.sh install $@
${{ upper (snake name) }}_HOME/local-dev/scripts/services/service-command.sh start $@
