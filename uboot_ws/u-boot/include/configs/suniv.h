/*
 * Configuration settings for new Allwinner F-series (suniv) CPU
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#ifndef __CONFIG_H
#define __CONFIG_H

#define CONFIG_SUNXI_USB_PHYS 1

/*
 * Include common sunxi configuration where most the settings are
 */
#include <configs/sunxi-common.h>

#endif /* __CONFIG_H */

#define CONFIG_BOOTCOMMAND   "sf probe 0 50000000; sf read 0x80C00000 0x100000 0x10000; sf read 0x80008000 0x110000 0x500000;  bootz 0x80008000 - 0x80C00000"
