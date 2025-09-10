FROM wukl/co:latest

WORKDIR /app

ARG FILE_NAME

COPY ${FILE_NAME}.s .
COPY --chmod=755 asm_run.sh .
COPY file_name .

CMD ./asm_run.sh ${DEBUG} ${FILE_NAME}

# Uncomment the docker build lines in run.sh if changes are made and rebuilding of the image is needed
