#include "libasm.h"
#include <stdio.h>
#include <errno.h>

int	main(void)
{
	char *str;
	char *str2;
	char copy[20];
	char	*ret;
	size_t len;
	int	errv;
 	
	str = "abcde";
	str2 = "abcdfg";
	len = ft_strlen(str);
	printf("ft_strlen returned: %lu\n", len);
	ret = ft_strcpy(copy, str);
	printf("ft_strcpy returned: %s\n", ret);
	printf("ft_strcmp returned: %d\n", ft_strcmp(str, str2));
	int ret_int = ft_write(8, str2, 3);
	errv = errno;
	printf("ft_write returned: %d\n", ret_int);
	perror(NULL);

	return (0);
}
