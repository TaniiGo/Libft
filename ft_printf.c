/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: keitanig <keitanig@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/26 15:32:10 by keitanig          #+#    #+#             */
/*   Updated: 2022/03/10 19:05:55 by keitanig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"
#include <stdio.h>

int	ft_printf(const char *format, ...)
{
	int		outputted_number;
	int		received_value;
	va_list	args;

	va_start(args, format);
	outputted_number = 0;
	while (*format != '\0')
	{
		if (*format == '%')
		{
			received_value = parse_converting_specifier(*(++format), args);
			printf("%d\n", received_value);
			if (received_value == -1)
				return (-1);
			else if (received_value > 0)
			{
				outputted_number += received_value;
				format++;
				printf("in\n");
			}
		}
		else
			outputted_number += write(1, format++, 1);
	}
	va_end(args);
	return (outputted_number);
}
