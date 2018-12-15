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
static const char *ng0 = "C:/arxitektonikh1/HRY415-project-3/code/RS_reg_line.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );


static void work_a_3501158778_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(99, ng0);

LAB3:    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11264);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 11056);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(119, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4072U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 11328);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 11072);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 4712U);
    t11 = *((char **)t10);
    t10 = (t0 + 11392);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t16 = (t0 + 11088);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 5032U);
    t5 = *((char **)t1);
    t1 = (t0 + 11392);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(140, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4232U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 11456);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 11104);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(150, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 4872U);
    t11 = *((char **)t10);
    t10 = (t0 + 11520);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t16 = (t0 + 11120);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 5192U);
    t5 = *((char **)t1);
    t1 = (t0 + 11520);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_5(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
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

LAB0:    xsi_set_current_line(204, ng0);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB17:    t20 = (t0 + 11584);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_fast(t20);

LAB2:    t25 = (t0 + 11136);
    *((int *)t25) = 1;

LAB1:    return;
LAB3:    t15 = (t0 + 11584);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast(t15);
    goto LAB2;

LAB5:    t3 = (t0 + 5672U);
    t10 = *((char **)t3);
    t3 = (t0 + 1832U);
    t11 = *((char **)t3);
    t12 = 1;
    if (5U == 5U)
        goto LAB11;

LAB12:    t12 = 0;

LAB13:    t1 = t12;
    goto LAB7;

LAB8:    t3 = (t0 + 3912U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t2 = t9;
    goto LAB10;

LAB11:    t13 = 0;

LAB14:    if (t13 < 5U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t3 = (t10 + t13);
    t14 = (t11 + t13);
    if (*((unsigned char *)t3) != *((unsigned char *)t14))
        goto LAB12;

LAB16:    t13 = (t13 + 1);
    goto LAB14;

LAB18:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_6(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
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

LAB0:    xsi_set_current_line(207, ng0);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB17:    t20 = (t0 + 11648);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_first_trans_fast(t20);

LAB2:    t25 = (t0 + 11152);
    *((int *)t25) = 1;

LAB1:    return;
LAB3:    t15 = (t0 + 11648);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)3;
    xsi_driver_first_trans_fast(t15);
    goto LAB2;

LAB5:    t3 = (t0 + 5832U);
    t10 = *((char **)t3);
    t3 = (t0 + 1832U);
    t11 = *((char **)t3);
    t12 = 1;
    if (5U == 5U)
        goto LAB11;

LAB12:    t12 = 0;

LAB13:    t1 = t12;
    goto LAB7;

LAB8:    t3 = (t0 + 3912U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t2 = t9;
    goto LAB10;

LAB11:    t13 = 0;

LAB14:    if (t13 < 5U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t3 = (t10 + t13);
    t14 = (t11 + t13);
    if (*((unsigned char *)t3) != *((unsigned char *)t14))
        goto LAB12;

LAB16:    t13 = (t13 + 1);
    goto LAB14;

LAB18:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_7(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(210, ng0);

LAB3:    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t1 = (t0 + 11712);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 11168);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3501158778_3212880686_p_8(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    unsigned char t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned char t25;
    char *t26;
    char *t27;
    unsigned char t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    unsigned char t35;
    unsigned char t36;
    unsigned char t37;
    char *t38;
    unsigned char t39;
    unsigned char t40;
    char *t41;
    unsigned char t43;
    unsigned int t44;
    char *t45;
    char *t46;
    unsigned char t47;
    char *t48;
    char *t49;
    unsigned char t50;
    unsigned char t51;
    char *t52;
    unsigned char t53;
    unsigned char t54;
    unsigned char t55;
    unsigned char t56;
    char *t57;
    int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned char t62;
    unsigned char t63;
    char *t64;
    char *t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned char t70;
    unsigned char t71;
    char *t72;
    char *t73;
    unsigned char t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned char t79;
    unsigned char t80;
    char *t81;
    char *t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned char t87;
    unsigned char t88;
    char *t89;
    char *t90;
    int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned char t95;
    unsigned char t96;
    char *t97;
    char *t98;
    unsigned char t99;
    unsigned char t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t106;
    char *t107;
    char *t108;
    char *t109;
    char *t110;

LAB0:    xsi_set_current_line(212, ng0);
    t2 = (t0 + 3912U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB77:    t105 = (t0 + 11776);
    t106 = (t105 + 56U);
    t107 = *((char **)t106);
    t108 = (t107 + 56U);
    t109 = *((char **)t108);
    *((unsigned char *)t109) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t105);

LAB2:    t110 = (t0 + 11184);
    *((int *)t110) = 1;

LAB1:    return;
LAB3:    t97 = (t0 + 11776);
    t101 = (t97 + 56U);
    t102 = *((char **)t101);
    t103 = (t102 + 56U);
    t104 = *((char **)t103);
    *((unsigned char *)t104) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t97);
    goto LAB2;

LAB5:    t2 = (t0 + 5672U);
    t12 = *((char **)t2);
    t2 = (t0 + 18787);
    t14 = 1;
    if (5U == 5U)
        goto LAB26;

LAB27:    t14 = 0;

LAB28:    if (t14 == 1)
        goto LAB23;

LAB24:    t11 = (unsigned char)0;

LAB25:    if (t11 == 1)
        goto LAB20;

LAB21:    t26 = (t0 + 5672U);
    t27 = *((char **)t26);
    t26 = (t0 + 18797);
    t29 = 1;
    if (5U == 5U)
        goto LAB41;

LAB42:    t29 = 0;

LAB43:    if (t29 == 1)
        goto LAB38;

LAB39:    t25 = (unsigned char)0;

LAB40:    t10 = t25;

LAB22:    if (t10 == 1)
        goto LAB17;

LAB18:    t33 = (t0 + 4072U);
    t38 = *((char **)t33);
    t39 = *((unsigned char *)t38);
    t40 = (t39 == (unsigned char)3);
    if (t40 == 1)
        goto LAB47;

LAB48:    t37 = (unsigned char)0;

LAB49:    t9 = t37;

LAB19:    if (t9 == 1)
        goto LAB14;

LAB15:    t48 = (t0 + 4072U);
    t49 = *((char **)t48);
    t50 = *((unsigned char *)t49);
    t51 = (t50 == (unsigned char)3);
    if (t51 == 1)
        goto LAB56;

LAB57:    t47 = (unsigned char)0;

LAB58:    t8 = t47;

LAB16:    if (t8 == 1)
        goto LAB11;

LAB12:    t48 = (t0 + 5992U);
    t57 = *((char **)t48);
    t58 = (1 - 1);
    t59 = (t58 * -1);
    t60 = (1U * t59);
    t61 = (0 + t60);
    t48 = (t57 + t61);
    t62 = *((unsigned char *)t48);
    t63 = (t62 == (unsigned char)3);
    if (t63 == 1)
        goto LAB62;

LAB63:    t56 = (unsigned char)0;

LAB64:    if (t56 == 1)
        goto LAB59;

LAB60:    t55 = (unsigned char)0;

LAB61:    t7 = t55;

LAB13:    if (t7 == 1)
        goto LAB8;

LAB9:    t81 = (t0 + 5992U);
    t82 = *((char **)t81);
    t83 = (1 - 1);
    t84 = (t83 * -1);
    t85 = (1U * t84);
    t86 = (0 + t85);
    t81 = (t82 + t86);
    t87 = *((unsigned char *)t81);
    t88 = (t87 == (unsigned char)3);
    if (t88 == 1)
        goto LAB74;

LAB75:    t80 = (unsigned char)0;

LAB76:    if (t80 == 1)
        goto LAB71;

LAB72:    t79 = (unsigned char)0;

LAB73:    t6 = t79;

LAB10:    t1 = t6;
    goto LAB7;

LAB8:    t6 = (unsigned char)1;
    goto LAB10;

LAB11:    t7 = (unsigned char)1;
    goto LAB13;

LAB14:    t8 = (unsigned char)1;
    goto LAB16;

LAB17:    t9 = (unsigned char)1;
    goto LAB19;

LAB20:    t10 = (unsigned char)1;
    goto LAB22;

LAB23:    t18 = (t0 + 5832U);
    t19 = *((char **)t18);
    t18 = (t0 + 18792);
    t21 = 1;
    if (5U == 5U)
        goto LAB32;

LAB33:    t21 = 0;

LAB34:    t11 = t21;
    goto LAB25;

LAB26:    t15 = 0;

LAB29:    if (t15 < 5U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t16 = (t12 + t15);
    t17 = (t2 + t15);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB27;

LAB31:    t15 = (t15 + 1);
    goto LAB29;

LAB32:    t22 = 0;

LAB35:    if (t22 < 5U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t23 = (t19 + t22);
    t24 = (t18 + t22);
    if (*((unsigned char *)t23) != *((unsigned char *)t24))
        goto LAB33;

LAB37:    t22 = (t22 + 1);
    goto LAB35;

LAB38:    t33 = (t0 + 4232U);
    t34 = *((char **)t33);
    t35 = *((unsigned char *)t34);
    t36 = (t35 == (unsigned char)3);
    t25 = t36;
    goto LAB40;

LAB41:    t30 = 0;

LAB44:    if (t30 < 5U)
        goto LAB45;
    else
        goto LAB43;

LAB45:    t31 = (t27 + t30);
    t32 = (t26 + t30);
    if (*((unsigned char *)t31) != *((unsigned char *)t32))
        goto LAB42;

LAB46:    t30 = (t30 + 1);
    goto LAB44;

LAB47:    t33 = (t0 + 5832U);
    t41 = *((char **)t33);
    t33 = (t0 + 18802);
    t43 = 1;
    if (5U == 5U)
        goto LAB50;

LAB51:    t43 = 0;

LAB52:    t37 = t43;
    goto LAB49;

LAB50:    t44 = 0;

LAB53:    if (t44 < 5U)
        goto LAB54;
    else
        goto LAB52;

LAB54:    t45 = (t41 + t44);
    t46 = (t33 + t44);
    if (*((unsigned char *)t45) != *((unsigned char *)t46))
        goto LAB51;

LAB55:    t44 = (t44 + 1);
    goto LAB53;

LAB56:    t48 = (t0 + 4232U);
    t52 = *((char **)t48);
    t53 = *((unsigned char *)t52);
    t54 = (t53 == (unsigned char)3);
    t47 = t54;
    goto LAB58;

LAB59:    t72 = (t0 + 5672U);
    t73 = *((char **)t72);
    t72 = (t0 + 18807);
    t75 = 1;
    if (5U == 5U)
        goto LAB65;

LAB66:    t75 = 0;

LAB67:    t55 = t75;
    goto LAB61;

LAB62:    t64 = (t0 + 5992U);
    t65 = *((char **)t64);
    t66 = (0 - 1);
    t67 = (t66 * -1);
    t68 = (1U * t67);
    t69 = (0 + t68);
    t64 = (t65 + t69);
    t70 = *((unsigned char *)t64);
    t71 = (t70 == (unsigned char)2);
    t56 = t71;
    goto LAB64;

LAB65:    t76 = 0;

LAB68:    if (t76 < 5U)
        goto LAB69;
    else
        goto LAB67;

LAB69:    t77 = (t73 + t76);
    t78 = (t72 + t76);
    if (*((unsigned char *)t77) != *((unsigned char *)t78))
        goto LAB66;

LAB70:    t76 = (t76 + 1);
    goto LAB68;

LAB71:    t97 = (t0 + 4072U);
    t98 = *((char **)t97);
    t99 = *((unsigned char *)t98);
    t100 = (t99 == (unsigned char)3);
    t79 = t100;
    goto LAB73;

LAB74:    t89 = (t0 + 5992U);
    t90 = *((char **)t89);
    t91 = (0 - 1);
    t92 = (t91 * -1);
    t93 = (1U * t92);
    t94 = (0 + t93);
    t89 = (t90 + t94);
    t95 = *((unsigned char *)t89);
    t96 = (t95 == (unsigned char)2);
    t80 = t96;
    goto LAB76;

LAB78:    goto LAB2;

}


extern void work_a_3501158778_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3501158778_3212880686_p_0,(void *)work_a_3501158778_3212880686_p_1,(void *)work_a_3501158778_3212880686_p_2,(void *)work_a_3501158778_3212880686_p_3,(void *)work_a_3501158778_3212880686_p_4,(void *)work_a_3501158778_3212880686_p_5,(void *)work_a_3501158778_3212880686_p_6,(void *)work_a_3501158778_3212880686_p_7,(void *)work_a_3501158778_3212880686_p_8};
	xsi_register_didat("work_a_3501158778_3212880686", "isim/tuxaies_entoles_xwris_eksarthseis_isim_beh.exe.sim/work/a_3501158778_3212880686.didat");
	xsi_register_executes(pe);
}
