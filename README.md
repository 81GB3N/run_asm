# RUN_ASM

## DESCRIPTION:
 Folder dedicated to making it easy to run assembly from a macbook by running it off of a docker container.

## SETUP
- Copy this folder to your directory in your app `git clone <>`
- Place this folder in the same folder as your program such as
```
MY_APP
│   run_asm   
|   <assembly_file>.s
```

- Dowload [docker](https://www.docker.com/products/docker-desktop/) from the internet and log in in the console using `Docker login`

- Change the **FILE_NAME** variable in the **file_name** file to the name of the file that you want to run, such as: **FILE_NAME**=*assembly_file* (without the .s or .asm file extention)

## TO RUN

1. Enter the *run_asm* folder
2. Run the comamnd `./run.sh` to run the file you entered in **FILE_NAME**

## ADDITIONAL OPTIONS

> DEBBUGING

>>To enter debug mode (Running with GDB instead of GCC) run the program normally with `-d` or `--debug` flags `./run -d` or `./run --debug`

> CHANGING FILENAME IN THE TERMINAL

>> If you want to run the program with a different name than it is in the file **file_name** you can change it in a few ways:
 >>> 1. Entering it as the second argument, if running with the debug flag: `./run -d <different_file>`
2.  As the first argument without the debug flag `./run <different_file>`
3. With the `--name` or the `-n` flag combined with the name of the file, this can run with our without other flags in any position (Some options where `--name` and `-n` are interchangable and not listed): `./run --name <different_file>` **OR** `./run -n <different_file>` **OR** `./run -d -n <different_file>` **`./run -n <different_file> -d`


