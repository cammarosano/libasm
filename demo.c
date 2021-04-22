/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   demo.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rcammaro <rcammaro@student.s19.be>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/22 23:39:22 by rcammaro          #+#    #+#             */
/*   Updated: 2021/04/22 23:48:32 by rcammaro         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <errno.h>

#define BUFFER_SIZE 100

void	ft_putnbr(int n)
{
	int		sign;
	char	c;

	sign = 1;
	if (n < 0)
		sign = -1;
	if (n > -10 && n < 10)
	{
		if (sign == -1)
			ft_write(1, "-", 1);
		c = n * sign + '0';
		ft_write(1, &c, 1);
	}
	else
	{
		ft_putnbr(n / 10);
		c = n % 10 * sign + '0';
		ft_write(1, &c, 1);
	}
}

void	ft_putstr(char *str)
{
	ft_write(1, str, ft_strlen(str));
}

int	test_ft_read(char *buf)
{
	int	ret;
	int	err_value;

	ret = ft_read(0, buf, BUFFER_SIZE);
	ft_putstr("\nft_read returned: ");
	ft_putnbr(ret);
	if (ret == -1)
	{
		err_value = errno;
		ft_putstr("\nft_read returned -1 (error)\n. errno: ");
		ft_putnbr(err_value);
		return (ret);
	}
	buf[ret] = '\0';
	ft_putstr("\nBravo! Your string has ");
	ft_putnbr(ft_strlen(buf));
	ft_putstr(" character(s), according to ft_strlen.\n");
	return (ret);
}

void	test_ft_strcpy(char *src, char *dst)
{
	char	*str;

	ft_putstr("\nSince you haven't typed anything, let's just copy the 1st\n");
	str = ft_strcpy(dst, src);
	ft_putstr("String returned by ft_strcpy: ");
	ft_putstr(str);
}

int	main(void)
{
	char	str_1[BUFFER_SIZE + 1];
	char	str_2[BUFFER_SIZE + 1];
	char	*str_3;
	int		ret;

	ft_putstr("Type something! (str_1): ");
	if (test_ft_read(str_1) < 0)
		return (1);
	ft_putstr("\nType something else... or not! (str_2): ");
	ret = test_ft_read(str_2);
	if (ret < 0)
		return (1);
	if (ret == 0)
		test_ft_strcpy(str_1, str_2);
	ft_putstr("\nft_strcmp(str_1, str_2) returned: ");
	ft_putnbr(ft_strcmp(str_1, str_2));
	str_3 = ft_strdup(str_1);
	if (!str_3)
		return (1);
	ft_putstr("\n\nTesting ft_strdup(str_1): ");
	ret = ft_write(1, str_3, ft_strlen(str_3));
	free(str_3);
	ft_putstr("\nft_write returned: ");
	ft_putnbr(ret);
	return (0);
}
