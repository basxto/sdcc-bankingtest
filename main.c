#define UINT8 unsigned char

UINT8 my_function(UINT8 a, UINT8 b, UINT8 c, UINT8 d){
    d -= a;
    d -= b*8;
    for(UINT8 i = 0; i < 6; ++i){
        c += a;
        c += b;
    }
    d -= c;
    return d;
}

void main(){
    UINT8 some_var = 5;
    some_var += my_function(0, 1, 0, 0xff);
}