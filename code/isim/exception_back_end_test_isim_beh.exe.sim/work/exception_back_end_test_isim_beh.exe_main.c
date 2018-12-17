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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_0715315823_3212880686_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    work_a_0200802635_3212880686_init();
    work_a_4108668482_3212880686_init();
    work_a_2306142521_3212880686_init();
    work_a_2537006236_3212880686_init();
    work_a_0330890280_1181938964_init();
    work_a_0290344353_3212880686_init();
    work_a_2895730147_3212880686_init();
    work_a_3230984351_3212880686_init();
    work_a_3720043404_3212880686_init();
    work_a_0922322361_1181938964_init();
    work_a_0038911295_3212880686_init();
    work_a_2081551473_3212880686_init();
    work_a_1625853307_3212880686_init();
    work_a_2668828412_3212880686_init();
    work_a_3759130379_3212880686_init();
    work_a_2545418251_3212880686_init();
    work_a_0002982409_3212880686_init();
    work_a_1171454391_3212880686_init();
    work_a_1926551616_3212880686_init();
    work_a_3626147423_3212880686_init();
    work_a_3903714526_3212880686_init();
    work_a_2615964831_3212880686_init();
    work_a_2453171190_3212880686_init();
    work_a_3501158778_3212880686_init();
    work_a_4173170879_3212880686_init();
    work_a_2917806682_3212880686_init();
    work_a_2103346257_3212880686_init();
    work_a_2857801645_3212880686_init();
    work_a_0749168933_3212880686_init();
    work_a_3359413048_3212880686_init();
    work_a_1914040071_3212880686_init();
    work_a_1287243584_3212880686_init();
    work_a_3252683731_3212880686_init();
    work_a_2567458311_3212880686_init();
    work_a_2967486628_3212880686_init();
    work_a_0377552751_3212880686_init();
    work_a_3780466275_3212880686_init();
    work_a_0819415890_3212880686_init();
    work_a_3917275865_3212880686_init();
    work_a_1731087649_2372691052_init();


    xsi_register_tops("work_a_1731087649_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}
