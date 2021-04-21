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
	errno = 0;
	int ret_int = ft_write(1, str2, 3);
	if (errno)
	{
		errv = errno;
		perror(NULL);

	}
	printf("ft_write returned: %d\n", ret_int);
	errno = 0;
	ret_int = ft_read(3, copy, 20);
	if (errno)
	{
		errv = errno;
		perror(NULL);
	}
	printf("ft_read returned: %d\n", ret_int);
	ft_write(1, copy, ret_int);

	// testing ft_strdup
	errno = 0;
	char *str3 = ft_strdup(str2);
	if (errno)
	{
		errv = errno;
		perror(NULL);
	}
	printf("ft_strdup returned: %s\n", str3);




	return (0);
}
