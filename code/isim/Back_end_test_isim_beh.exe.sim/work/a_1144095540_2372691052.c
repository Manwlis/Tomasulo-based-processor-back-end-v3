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
static const char *ng0 = "C:/arxitektonikh1/HRY415-project-2/code/Back_end_test.vhd";



static void work_a_1144095540_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 4064);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3240);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1144095540_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3680U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 2);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 4128);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 6916);
    t6 = (t0 + 4192);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 6918);
    t6 = (t0 + 4256);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 6920);
    t6 = (t0 + 4320);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 6925);
    t6 = (t0 + 4384);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 6930);
    t6 = (t0 + 4448);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t4);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 4128);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 * 3);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t5);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 4128);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 6935);
    t6 = (t0 + 4192);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 6937);
    t6 = (t0 + 4256);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 6939);
    t6 = (t0 + 4320);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 6944);
    t6 = (t0 + 4384);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 6949);
    t6 = (t0 + 4448);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 3488);
    xsi_process_wait(t2, t4);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4128);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 6954);
    t6 = (t0 + 4320);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 6959);
    t6 = (t0 + 4448);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 5U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(93, ng0);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    goto LAB2;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

}


extern void work_a_1144095540_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1144095540_2372691052_p_0,(void *)work_a_1144095540_2372691052_p_1};
	xsi_register_didat("work_a_1144095540_2372691052", "isim/Back_end_test_isim_beh.exe.sim/work/a_1144095540_2372691052.didat");
	xsi_register_executes(pe);
}
