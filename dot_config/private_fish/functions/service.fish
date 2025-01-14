function service --description "Manage local services via Docker Compose"
    switch $argv[1]
        case ls list
            service config | yq e '.services | keys' -
        case start
            service up -d $argv[2..]
        case stop
            service rm -sfv $argv[2..]
        case status
            if test -n "$(service ps --status running -q "$argv[2]" 2>/dev/null)"
                echo "$argv[2] is running"
            else
                echo "$argv[2] is stopped"
            end
        case run
            service exec $argv[2..]
        case port
            # grab the first listed port if none given
            if test -n $argv[3]
                set argv[3] "$(service config | yq e ".services.$argv[2].ports[0].target" -)"
            end
            service -- port $argv[2..]
        case -h --help help ""
            echo "Wrapper around Docker Compose to work with local services like Redis, Postgres, and MySQL

    service list                        List available services
    service start <service>             Start a Service
    service stop <service>              Stop a service
    service status <service>            Is service running?
    service run <service> <command>     Run a command in the service container
    service port <service> [port]       Display the local port binding for the service"
        case '*'
            test $argv[1] = "--" && set -e argv[1]
            docker compose --file ~/.config/services.yml $argv
    end
end
