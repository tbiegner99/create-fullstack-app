
ALL_SERVICES=$(find ${{ upper (snake name) }}_HOME/backend/ -maxdepth 1 -mindepth 1 -type d  -exec basename {} \;)

ALL_SERVICES=($ALL_SERVICES "ui")