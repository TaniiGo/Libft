/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: keitanig <keitanig@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/26 15:32:10 by keitanig          #+#    #+#             */
/*   Updated: 2022/03/02 12:34:56 by keitanig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

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
			if (received_value >= 0)
			{
				outputted_number += received_value;
				format++;
			}
			if (received_value == -1)
				return (-1);
		}
		else
			outputted_number += write(1, format++, 1);
	}
	va_end(args);
	return (outputted_number);
}
