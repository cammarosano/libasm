#include "libasm.h"
#include <stdio.h>
#include <errno.h>

void	test_ft_write(void)
{
	ssize_t	ret;
	int		errno_save;

	printf("Calling ft_write with a bad file descriptor\n");
	ret = ft_write(42, "hola", 42);
	errno_save = errno;
	printf("Return value: %ld\n", ret);
	printf("errno: %d\n", errno);
	perror("Error description");
	printf("Calling ft_write with a bad pointer\n");
	ret = ft_write(1, NULL, 42);
	errno_save = errno;
	printf("Return value: %ld\n", ret);
	printf("errno: %d\n", errno);
	perror("Error description");
}

int	main(void)
{
	test_ft_write();
}
