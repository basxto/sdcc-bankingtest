const char rom2_var = 0xCD;

char rom2_function(){
    return 43;
}

char rom2_function2(){
    return rom2_function();
}