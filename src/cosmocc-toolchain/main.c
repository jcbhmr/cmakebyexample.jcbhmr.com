#include <stdio.h>
// cosmocc adds a cosmo.h header.
#include <cosmo.h>

int main() {
    printf("IsLinux()=%d\n", IsLinux());
    printf("IsMetal()=%d\n", IsMetal());
    printf("IsWindows()=%d\n", IsWindows());
    printf("IsBsd()=%d\n", IsBsd());
    printf("IsXnu()=%d\n", IsXnu());
    printf("IsFreebsd()=%d\n", IsFreebsd());
    printf("IsOpenbsd()=%d\n", IsOpenbsd());
    printf("IsNetbsd()=%d\n", IsNetbsd());
    return 0;
}