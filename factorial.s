#initializing variables
.data
    introduction: .asciz "Jonas Balukonis: jbalukonis && Gabriel Pagano: gpereirapagano -- factorials\n"
    ph: .asciz "%ld"
    enter_factorial: .asciz "Enter the factorial number n: "
    factorial_num: .quad 0
    answer: .asciz "Answer: %ld\n"

# actual beggining of code
.text
.global main
main:

    # prologue
    pushq %rbp
    movq %rsp, %rbp

    # Print the introduction 
    movq $introduction, %rdi # moves introduction to rdi as the first argument
    xorq %rax, %rax # clears rax
    call printf

    # enter base
    movq $enter_factorial, %rdi # moves enter_factorial to rdi as the first argument
    xorq %rax, %rax # clears rax
    call printf

    movq $ph, %rdi # ph as the placeholder for the scan in rdi
    movq $factorial_num, %rsi # factorial_num as the value to write to in function argument rsi
    call scanf

    movq factorial_num, %rdi # move factorial_num to be the first argument of the function call
    call factorial

    # printing the answer
    movq $answer, %rdi # load the sentence with the placeholder
    movq %rax, %rsi # load the rax (function return value) to rsi as an argument
    xorq %rax, %rax # clear rax
    call printf

    # epilogue
    movq %rbp, %rsp
    popq %rbp

    # exit 
    movq $0, %rax
    call exit

factorial:
    # subroutine prologue
    pushq %rbp
    movq %rsp, %rbp

    # save the input to rax
    movq %rdi, %rax

    # is rax is 0 or 1 jump to factorial end
    cmp $0, %rax # rax =? 0
    je factorial_end # jump if 0

    cmp $1, %rax # rax =? 1
    je factorial_end # jump if 1

    # save rax in the stack
    pushq %rax

    # decrement the old rax value
    decq %rax # does the same as n - 1

    # recursivly call factorial
    movq %rax, %rdi # move the rax to rdi as the function value
    call factorial # call the recursive function get_factorial(n - 1)

    # write the saved rax value to rbx
    popq %rbx

    # multiply rbx by rax and save in rax
    imulq %rbx, %rax # rax = rax * rbx


    end_end: # jump here if the baseline paremeters match (0 or 1)

    # subroutine epilogue
    movq %rbp, %rsp
    popq %rbp

    # return from the function with rax as the return value
    ret

factorial_end:
    movq $1, %rax
    jmp end_end
/*
pseudo code for factorial function
get_factorial accepts a non negative number as the input
Recursively interates until it gets n! number
int get_factorial(int n){
    if(n == 0 || n == 1) return 1;
    return n * get_factorial(n - 1)
}
*/
