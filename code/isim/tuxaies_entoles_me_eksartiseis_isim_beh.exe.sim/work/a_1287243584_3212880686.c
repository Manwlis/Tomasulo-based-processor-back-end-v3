/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/arxitektonikh1/HRY415-project-2/code/RS_unit_logical.vhd";



static void work_a_1287243584_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned char t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;

LAB0:    xsi_set_current_line(134, ng0);
    t1 = (t0 + 5240U);
    t2 = *((char **)t1);
    t1 = (t0 + 13924);
    t4 = 1;
    if (2U == 2U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:    t19 = (t0 + 5240U);
    t20 = *((char **)t19);
    t19 = (t0 + 13926);
    t22 = 1;
    if (2U == 2U)
        goto LAB13;

LAB14:    t22 = 0;

LAB15:    if (t22 != 0)
        goto LAB11;

LAB12:
LAB19:    t37 = (t0 + 13928);
    t39 = (t0 + 7680);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memcpy(t43, t37, 2U);
    xsi_driver_first_trans_fast_port(t39);

LAB2:    t44 = (t0 + 7600);
    *((int *)t44) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 4280U);
    t9 = *((char **)t8);
    t10 = (0 - 0);
    t11 = (t10 * 1);
    t12 = (2U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = (t0 + 7680);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t8, 2U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 2U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    t26 = (t0 + 4280U);
    t27 = *((char **)t26);
    t28 = (1 - 0);
    t29 = (t28 * 1);
    t30 = (2U * t29);
    t31 = (0 + t30);
    t26 = (t27 + t31);
    t32 = (t0 + 7680);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    memcpy(t36, t26, 2U);
    xsi_driver_first_trans_fast_port(t32);
    goto LAB2;

LAB13:    t23 = 0;

LAB16:    if (t23 < 2U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t24 = (t20 + t23);
    t25 = (t19 + t23);
    if (*((unsigned char *)t24) != *((unsigned char *)t25))
        goto LAB14;

LAB18:    t23 = (t23 + 1);
    goto LAB16;

LAB20:    goto LAB2;

}


extern void work_a_1287243584_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1287243584_3212880686_p_0};
	xsi_register_didat("work_a_1287243584_3212880686", "isim/tuxaies_entoles_me_eksartiseis_isim_beh.exe.sim/work/a_1287243584_3212880686.didat");
	xsi_register_executes(pe);
}
