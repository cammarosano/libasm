/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   demo_errors.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/23 16:46:51 by user42            #+#    #+#             */
/*   Updated: 2021/04/23 16:46:52 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <errno.h>

void	test_ft_read(void)
{
	ssize_t	ret;
	int		errno_save;
	char	buffer[1024];

	printf("Calling ft_read with a bad file descriptor\n");
	ret = ft_read(42, buffer, 30);
	errno_save = errno;
	printf("Return value: %ld\n", ret);
	printf("errno: %d\n", errno_save);
	perror("Error description");
	printf("Calling ft_read with a bad pointer (reading from stdin)\n");
	ret = ft_read(0, NULL, 50);
	errno_save = errno;
	printf("Return value: %ld\n", ret);
	printf("errno: %d\n", errno_save);
	perror("Error description");
}

void	test_ft_write(void)
{
	ssize_t	ret;
	int		errno_save;

	printf("Calling ft_write with a bad file descriptor\n");
	ret = ft_write(42, "hola", 42);
	errno_save = errno;
	printf("Return value: %ld\n", ret);
	printf("errno: %d\n", errno_save);
	perror("Error description");
	printf("Calling ft_write with a bad pointer\n");
	ret = ft_write(1, NULL, 42);
	errno_save = errno;
	printf("Return value: %ld\n", ret);
	printf("errno: %d\n", errno_save);
	perror("Error description");
}

int	main(void)
{
	test_ft_write();
	test_ft_read();
	return (0);
}
