function watch_files
    # check if both parameters are provided
    if test (count $argv) -ne 3
        echo "Usage watch_files /files/dir '.*\.tex\$' 'command'"
        return 1
    end

    set directory $argv[1]
    set includes $argv[2]
    set command $argv[3]

    # monitor file changes in the specified directory 
    inotifywait \
        -m \
        -e modify,create,delete \
        --include $includes \
        $directory |
        while read -r dir events filename
            echo "File $filename was changed"
            eval $command
        end
end

