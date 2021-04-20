#include "libasm.h"
#include <stdio.h>

int	main(void)
{
	char *str = "hola_muchacho";
	size_t len;

	len = ft_strlen(str);
	printf("ft_strlen returned: %lu\n", len);


	return (0);
}
