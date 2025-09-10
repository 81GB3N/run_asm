
source file_name

# Initialize DEBUG to false
DEBUG=false


# 
# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --debug|-d) DEBUG=true ;;
        --name|-n) FILE_NAME="$2"; shift ;; # Set FILE_NAME with --name or -n
        *) FILE_NAME="$1" ;; # Assume the last argument is the file name
    esac
    shift
done

# If FILE_NAME is not set, use the value from the sourced file
if [ -z "$FILE_NAME" ]; then
    FILE_NAME="$FILE_NAME"
fi

#throws error if there arent any .s files
if [ -z "$(ls ../*.s 2>/dev/null)" ]; then
    echo "Error: No .s file exists in the parent directory."
fi

rm *.s

# throws error if there arent any matching files to the specified file in the file_name file
if [ ! -f "../$FILE_NAME.s" ]; then
    echo "Error: File '../$FILE_NAME.s' does not exist."
    exit 1
fi

cp ../$FILE_NAME.s $FILE_NAME.s

# builds docker image and runs it (discard output messeges, dont discard warnings and errors)
docker build --build-arg FILE_NAME=$FILE_NAME --platform=linux/amd64 -t asm . 2>&1 | grep -E "(error|Error|ERROR|warning|failed|Failed)" | grep -v "1 warning found (use docker --debug to expand):" || true
echo "Docker built succesfully"

# Run docker container and incude debug variable at runtime
docker run --rm -e DEBUG=$DEBUG -e FILE_NAME=$FILE_NAME --platform=linux/amd64 -it asm