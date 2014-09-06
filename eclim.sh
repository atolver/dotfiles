#!/usr/bin/env bash
case "$1" in
    start)
        echo -n "Starting eclim..."
        ./start_eclim > /dev/null 2>&1
        echo "OK"
        ;;
    stop)
        echo -n "Shutting down eclim..."
        ./stop_eclim > /dev/null 2>&1
        echo "OK"
        ;;
    *)
        echo "Usage: $0 start|stop"
        exit 1
esac
exit 0
