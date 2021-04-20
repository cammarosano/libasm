#include "libasm.h"
#include <stdio.h>

int	main(void)
{
	char *str;
	char copy[20];
	char	*ret;
	size_t len;
 	
	str = "hola_mducdhachod";
	len = ft_strlen(str);
	printf("ft_strlen returned: %lu\n", len);
	ret = ft_strcpy(copy, str);
	printf("ft_strcpy returned: %s\n", ret);

	return (0);
}
