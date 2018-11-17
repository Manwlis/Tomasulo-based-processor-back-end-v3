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
static const char *ng0 = "C:/arxitektonikh1/HRY415-project-2/code/RS_logica_control.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1914040071_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(32, ng0);

LAB3:    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t1 = (t0 + 8168);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 7944);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1914040071_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t2 = (t0 + 13197);
    t5 = 1;
    if (2U == 2U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB20:    t21 = (t0 + 8232);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t21);

LAB2:    t26 = (t0 + 7960);
    *((int *)t26) = 1;

LAB1:    return;
LAB3:    t16 = (t0 + 8232);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB2;

LAB5:    t9 = (t0 + 3752U);
    t10 = *((char **)t9);
    t9 = (t0 + 13199);
    t12 = 1;
    if (2U == 2U)
        goto LAB14;

LAB15:    t12 = 0;

LAB16:    t1 = t12;
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 2U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t7 = (t3 + t6);
    t8 = (t2 + t6);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB9;

LAB13:    t6 = (t6 + 1);
    goto LAB11;

LAB14:    t13 = 0;

LAB17:    if (t13 < 2U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t14 = (t10 + t13);
    t15 = (t9 + t13);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB15;

LAB19:    t13 = (t13 + 1);
    goto LAB17;

LAB21:    goto LAB2;

}

static void work_a_1914040071_3212880686_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(34, ng0);

LAB3:    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t2 = (t0 + 13132U);
    t4 = (t0 + 3752U);
    t5 = *((char **)t4);
    t4 = (t0 + 13132U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (2U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 8296);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 2U);
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 7976);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(2U, t9, 0);
    goto LAB6;

}

static void work_a_1914040071_3212880686_p_3(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(35, ng0);

LAB3:    t2 = (t0 + 3912U);
    t3 = *((char **)t2);
    t2 = (t0 + 13132U);
    t4 = (t0 + 4072U);
    t5 = *((char **)t4);
    t4 = (t0 + 13132U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (2U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 8360);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 2U);
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 7992);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(2U, t9, 0);
    goto LAB6;

}

static void work_a_1914040071_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(37, ng0);

LAB3:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 8424);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 8008);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1914040071_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 13228);
    t6 = (t0 + 8488);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 13230);
    t6 = (t0 + 8552);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 13232);
    t6 = (t0 + 8616);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);

LAB3:    t1 = (t0 + 8024);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 3112U);
    t6 = *((char **)t1);
    t7 = (0 - 1);
    t8 = (t7 * -1);
    t9 = (1U * t8);
    t10 = (0 + t9);
    t1 = (t6 + t10);
    t11 = *((unsigned char *)t1);
    t12 = (t11 == (unsigned char)2);
    if (t12 == 1)
        goto LAB8;

LAB9:    t13 = (t0 + 3752U);
    t14 = *((char **)t13);
    t15 = (0 - 1);
    t16 = (t15 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t13 = (t14 + t18);
    t19 = *((unsigned char *)t13);
    t20 = (t19 == (unsigned char)3);
    t5 = t20;

LAB10:    if (t5 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t7 = (1 - 1);
    t8 = (t7 * -1);
    t9 = (1U * t8);
    t10 = (0 + t9);
    t1 = (t2 + t10);
    t4 = *((unsigned char *)t1);
    t5 = (t4 == (unsigned char)2);
    if (t5 == 1)
        goto LAB13;

LAB14:    t6 = (t0 + 3752U);
    t13 = *((char **)t6);
    t15 = (1 - 1);
    t16 = (t15 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t6 = (t13 + t18);
    t11 = *((unsigned char *)t6);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;

LAB15:    if (t3 != 0)
        goto LAB11;

LAB12:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 13219);
    t6 = (t0 + 8488);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 13221);
    t6 = (t0 + 8552);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 13223);
    t6 = (t0 + 8616);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(46, ng0);
    t21 = (t0 + 13201);
    t23 = (t0 + 8488);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t21, 2U);
    xsi_driver_first_trans_fast(t23);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 13203);
    t6 = (t0 + 8552);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 13205);
    t6 = (t0 + 8616);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB6;

LAB8:    t5 = (unsigned char)1;
    goto LAB10;

LAB11:    xsi_set_current_line(51, ng0);
    t14 = (t0 + 13210);
    t22 = (t0 + 8488);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t14, 2U);
    xsi_driver_first_trans_fast(t22);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 13212);
    t6 = (t0 + 8552);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 13214);
    t6 = (t0 + 8616);
    t13 = (t6 + 56U);
    t14 = *((char **)t13);
    t21 = (t14 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB6;

LAB13:    t3 = (unsigned char)1;
    goto LAB15;

}

static void work_a_1914040071_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 13288);
    t5 = (t0 + 8808);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 13290);
    t5 = (t0 + 8680);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 5U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 13295);
    t5 = (t0 + 8744);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);

LAB3:    t1 = (t0 + 8040);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 2952U);
    t5 = *((char **)t1);
    t1 = (t0 + 13237);
    t7 = xsi_mem_cmp(t1, t5, 2U);
    if (t7 == 1)
        goto LAB6;

LAB10:    t8 = (t0 + 13239);
    t10 = xsi_mem_cmp(t8, t5, 2U);
    if (t10 == 1)
        goto LAB7;

LAB11:    t11 = (t0 + 13241);
    t13 = xsi_mem_cmp(t11, t5, 2U);
    if (t13 == 1)
        goto LAB8;

LAB12:
LAB9:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 13279);
    t5 = (t0 + 8680);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 5U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 13284);
    t5 = (t0 + 8744);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 13286);
    t5 = (t0 + 8808);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(78, ng0);
    t14 = (t0 + 13243);
    t16 = (t0 + 8680);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t14, 5U);
    xsi_driver_first_trans_fast_port(t16);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 13248);
    t5 = (t0 + 8744);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 13250);
    t5 = (t0 + 8808);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    goto LAB5;

LAB7:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 13252);
    t5 = (t0 + 8680);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 5U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 13257);
    t5 = (t0 + 8744);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 13259);
    t5 = (t0 + 8808);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    goto LAB5;

LAB8:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)1);
    if (t4 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 13270);
    t5 = (t0 + 8680);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 5U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 13275);
    t5 = (t0 + 8744);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 13277);
    t5 = (t0 + 8808);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);

LAB15:    goto LAB5;

LAB13:;
LAB14:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 13261);
    t6 = (t0 + 8680);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 5U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 13266);
    t5 = (t0 + 8744);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 13268);
    t5 = (t0 + 8808);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    goto LAB15;

}

static void work_a_1914040071_3212880686_p_7(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(116, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(125, ng0);
    t1 = (t0 + 13313);
    t5 = (t0 + 8872);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);

LAB3:    t1 = (t0 + 8056);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t1 = (t0 + 13297);
    t7 = 1;
    if (5U == 5U)
        goto LAB8;

LAB9:    t7 = 0;

LAB10:    if (t7 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 13304);
    t3 = 1;
    if (5U == 5U)
        goto LAB16;

LAB17:    t3 = 0;

LAB18:    if (t3 != 0)
        goto LAB14;

LAB15:    xsi_set_current_line(122, ng0);
    t1 = (t0 + 13311);
    t5 = (t0 + 8872);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 2U);
    xsi_driver_first_trans_fast(t5);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(118, ng0);
    t11 = (t0 + 13302);
    t13 = (t0 + 8872);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 2U);
    xsi_driver_first_trans_fast(t13);
    goto LAB6;

LAB8:    t8 = 0;

LAB11:    if (t8 < 5U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t9 = (t5 + t8);
    t10 = (t1 + t8);
    if (*((unsigned char *)t9) != *((unsigned char *)t10))
        goto LAB9;

LAB13:    t8 = (t8 + 1);
    goto LAB11;

LAB14:    xsi_set_current_line(120, ng0);
    t10 = (t0 + 13309);
    t12 = (t0 + 8872);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t10, 2U);
    xsi_driver_first_trans_fast(t12);
    goto LAB6;

LAB16:    t8 = 0;

LAB19:    if (t8 < 5U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t6 = (t2 + t8);
    t9 = (t1 + t8);
    if (*((unsigned char *)t6) != *((unsigned char *)t9))
        goto LAB17;

LAB21:    t8 = (t8 + 1);
    goto LAB19;

}

static void work_a_1914040071_3212880686_p_8(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(133, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t1 = (t0 + 13315);
    t4 = 1;
    if (2U == 2U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t1 = (t0 + 13317);
    t4 = 1;
    if (2U == 2U)
        goto LAB13;

LAB14:    t4 = 0;

LAB15:    if (t4 != 0)
        goto LAB11;

LAB12:    xsi_set_current_line(138, ng0);
    t1 = (t0 + 8936);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 8072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(134, ng0);
    t8 = (t0 + 8936);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t8);
    goto LAB3;

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

LAB11:    xsi_set_current_line(136, ng0);
    t8 = (t0 + 8936);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t8);
    goto LAB3;

LAB13:    t5 = 0;

LAB16:    if (t5 < 2U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB14;

LAB18:    t5 = (t5 + 1);
    goto LAB16;

}

static void work_a_1914040071_3212880686_p_9(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(146, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8088);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(147, ng0);
    t3 = (t0 + 3432U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t3 = (t0 + 9000);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

}


extern void work_a_1914040071_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1914040071_3212880686_p_0,(void *)work_a_1914040071_3212880686_p_1,(void *)work_a_1914040071_3212880686_p_2,(void *)work_a_1914040071_3212880686_p_3,(void *)work_a_1914040071_3212880686_p_4,(void *)work_a_1914040071_3212880686_p_5,(void *)work_a_1914040071_3212880686_p_6,(void *)work_a_1914040071_3212880686_p_7,(void *)work_a_1914040071_3212880686_p_8,(void *)work_a_1914040071_3212880686_p_9};
	xsi_register_didat("work_a_1914040071_3212880686", "isim/entoles_se_mia_monada_isim_beh.exe.sim/work/a_1914040071_3212880686.didat");
	xsi_register_executes(pe);
}
