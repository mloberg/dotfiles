function mk --description "mkdir and cd into it"
    set -l dir $argv[1]
    mkdir -p $dir && cd $dir
end
