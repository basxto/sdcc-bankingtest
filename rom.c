#pragma bank 1

const char rom_var = 0xAB;

char rom_function(){
    return 42;
}

char rom_function2(){
    return rom_function();
}