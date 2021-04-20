#include "libasm.h"
#include <stdio.h>

int	main(void)
{
	char *str;
	char *str2;
	char copy[20];
	char	*ret;
	size_t len;
 	
	str = "amor";
	str2 = "amor";
	len = ft_strlen(str);
	printf("ft_strlen returned: %lu\n", len);
	ret = ft_strcpy(copy, str);
	printf("ft_strcpy returned: %s\n", ret);
	printf("ft_strcmp returned: %d\n", ft_strcmp(str, str2));

	return (0);
}
