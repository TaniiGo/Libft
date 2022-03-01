/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: keitanig <keitanig@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/10 20:39:32 by keigo             #+#    #+#             */
/*   Updated: 2022/02/05 17:23:52 by keitanig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putnbr_fd(int n, int fd)
{
	unsigned int	num;

	if (n < 0)
	{
		ft_putchar_fd('-', fd);
		num = -n;
	}
	else
		num = n;
	if (10 <= num)
		ft_putnbr_fd(num / 10, fd);
	ft_putchar_fd(num % 10 + '0', fd);
}
