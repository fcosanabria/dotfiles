function unzip-there --description 'Extract zip file into a directory named after the archive'
    # Check if a file was provided
    if test (count $argv) -eq 0
        echo "Usage: unzip-there <archive.zip>"
        return 1
    end

    set -l zipfile $argv[1]

    # Check if file exists
    if not test -f "$zipfile"
        echo "Error: File '$zipfile' does not exist"
        return 1
    end

    # Check if it's a zip file
    if not string match -q "*.zip" "$zipfile"
        echo "Error: File must have .zip extension"
        return 1
    end

    # Get basename without .zip extension
    set -l dirname (basename -s .zip "$zipfile")

    # Try to create directory and extract only if successful
    if mkdir "$dirname"
        echo "Extracting to: $dirname/"
        unzip -d "$dirname" -qqnXK "$zipfile"
        echo "Done!"
    else
        echo "Error: Directory '$dirname' already exists. Skipping extraction to avoid conflicts."
        return 1
    end
end
