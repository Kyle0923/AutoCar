#include "auto_car_common.hpp"

int main(int argc, char *argv[])
{
    std::cout << "Hello World" << std::endl;
    while (argc > 1)
    {
        std::cout << argv[--argc] << std::endl;
    }
    return 0;
}
