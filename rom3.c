#pragma bank 3

const char rom3_var = 0xEF;

char rom3_function(){
    return 44;
}

char rom3_function2(){
    return rom3_function();
}