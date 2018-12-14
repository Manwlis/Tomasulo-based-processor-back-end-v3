<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="available" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="Ri" />
        <signal name="Fu_type" />
        <signal name="Rj" />
        <signal name="cdb_valid" />
        <signal name="cdb_Q" />
        <signal name="cdb_value" />
        <signal name="Rk" />
        <signal name="inst_valid" />
        <signal name="commit_data" />
        <signal name="commit_reg" />
        <signal name="PC_exception" />
        <signal name="V_commit" />
        <signal name="Qk" />
        <signal name="forward_data_k" />
        <signal name="forward_data_j" />
        <signal name="Qj" />
        <signal name="tag_issue" />
        <signal name="XLXN_74" />
        <signal name="XLXN_75" />
        <signal name="XLXN_77" />
        <signal name="forward_control_j" />
        <signal name="forward_control_k" />
        <port polarity="Output" name="available" />
        <port polarity="Input" name="Ri" />
        <port polarity="Input" name="Fu_type" />
        <port polarity="Input" name="Rj" />
        <port polarity="Input" name="cdb_valid" />
        <port polarity="Input" name="cdb_Q" />
        <port polarity="Input" name="cdb_value" />
        <port polarity="Input" name="Rk" />
        <port polarity="Input" name="inst_valid" />
        <port polarity="Output" name="commit_data" />
        <port polarity="Output" name="commit_reg" />
        <port polarity="Output" name="PC_exception" />
        <port polarity="Output" name="V_commit" />
        <port polarity="Output" name="Qk" />
        <port polarity="Output" name="forward_data_k" />
        <port polarity="Output" name="forward_data_j" />
        <port polarity="Output" name="Qj" />
        <port polarity="Output" name="tag_issue" />
        <port polarity="Output" name="forward_control_j" />
        <port polarity="Output" name="forward_control_k" />
        <blockdef name="m8_1e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-224" y2="-224" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-288" y2="-288" x1="0" />
            <line x2="96" y1="-352" y2="-352" x1="0" />
            <line x2="96" y1="-416" y2="-416" x1="0" />
            <line x2="96" y1="-544" y2="-544" x1="0" />
            <line x2="96" y1="-608" y2="-608" x1="0" />
            <line x2="96" y1="-672" y2="-672" x1="0" />
            <line x2="96" y1="-736" y2="-736" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="160" />
            <line x2="160" y1="-268" y2="-160" x1="160" />
            <line x2="96" y1="-224" y2="-224" x1="128" />
            <line x2="128" y1="-264" y2="-224" x1="128" />
            <line x2="96" y1="-96" y2="-96" x1="192" />
            <line x2="192" y1="-276" y2="-96" x1="192" />
            <line x2="96" y1="-32" y2="-32" x1="224" />
            <line x2="224" y1="-280" y2="-32" x1="224" />
            <line x2="256" y1="-512" y2="-512" x1="320" />
            <line x2="96" y1="-768" y2="-256" x1="96" />
            <line x2="96" y1="-704" y2="-768" x1="256" />
            <line x2="256" y1="-288" y2="-704" x1="256" />
            <line x2="256" y1="-256" y2="-288" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="96" y1="-480" y2="-480" x1="0" />
        </blockdef>
        <block symbolname="m8_1e" name="XLXI_6">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_2" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_7" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="commit_data" name="O" />
        </block>
        <block symbolname="m8_1e" name="XLXI_8">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_9" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_14" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="PC_exception" name="O" />
        </block>
        <block symbolname="m8_1e" name="XLXI_22">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_8" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_7" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="commit_reg" name="O" />
        </block>
        <block symbolname="m8_1e" name="XLXI_17">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_4" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_5" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="Qk" name="O" />
        </block>
        <block symbolname="m8_1e" name="XLXI_5">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_2" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_5" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="forward_data_k" name="O" />
        </block>
        <block symbolname="m8_1e" name="XLXI_18">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_2" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_1" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="forward_data_j" name="O" />
        </block>
        <block symbolname="m8_1e" name="XLXI_19">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_4" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_1" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="Qj" name="O" />
        </block>
        <block symbolname="m8_1e" name="XLXI_14">
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin signalname="XLXN_4" name="D7" />
            <blockpin name="E" />
            <blockpin name="S0" />
            <blockpin signalname="XLXN_13" name="S1" />
            <blockpin name="S2" />
            <blockpin signalname="tag_issue" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7040" height="5440">
        <branch name="XLXN_1">
            <wire x2="1696" y1="1168" y2="3264" x1="1696" />
            <wire x2="2544" y1="3264" y2="3264" x1="1696" />
            <wire x2="3424" y1="3264" y2="3264" x1="2544" />
            <wire x2="3424" y1="3264" y2="3456" x1="3424" />
            <wire x2="2544" y1="3264" y2="3456" x1="2544" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1888" y1="1184" y2="3104" x1="1888" />
            <wire x2="4608" y1="3104" y2="3104" x1="1888" />
            <wire x2="5488" y1="3104" y2="3104" x1="4608" />
            <wire x2="5488" y1="3104" y2="3456" x1="5488" />
            <wire x2="4608" y1="3104" y2="3456" x1="4608" />
        </branch>
        <instance x="1088" y="2240" name="XLXI_6" orien="R180" />
        <branch name="XLXN_2">
            <wire x2="2672" y1="2528" y2="2528" x1="1088" />
            <wire x2="2672" y1="2528" y2="2896" x1="2672" />
            <wire x2="2672" y1="2896" y2="3456" x1="2672" />
            <wire x2="4736" y1="2896" y2="2896" x1="2672" />
            <wire x2="4736" y1="2896" y2="3456" x1="4736" />
            <wire x2="2672" y1="1712" y2="2528" x1="2672" />
        </branch>
        <instance x="1088" y="1376" name="XLXI_22" orien="R180" />
        <branch name="XLXN_7">
            <wire x2="1344" y1="1536" y2="1536" x1="1088" />
            <wire x2="1344" y1="1536" y2="2400" x1="1344" />
            <wire x2="1344" y1="2400" y2="2400" x1="1088" />
            <wire x2="1344" y1="1168" y2="1536" x1="1344" />
        </branch>
        <rect width="2640" x="2240" y="1468" height="244" />
        <branch name="XLXN_8">
            <wire x2="2240" y1="1664" y2="1664" x1="1088" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="2320" y1="1120" y2="1120" x1="2176" />
            <wire x2="2320" y1="1120" y2="1472" x1="2320" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="2480" y1="960" y2="960" x1="2176" />
            <wire x2="2480" y1="960" y2="1472" x1="2480" />
        </branch>
        <rect width="1040" x="1136" y="748" height="428" />
        <branch name="commit_data">
            <wire x2="768" y1="2752" y2="2752" x1="736" />
        </branch>
        <iomarker fontsize="80" x="736" y="2752" name="commit_data" orien="R180" />
        <branch name="commit_reg">
            <wire x2="768" y1="1888" y2="1888" x1="736" />
        </branch>
        <iomarker fontsize="80" x="736" y="1888" name="commit_reg" orien="R180" />
        <branch name="PC_exception">
            <wire x2="6096" y1="2432" y2="2432" x1="6032" />
        </branch>
        <iomarker fontsize="80" x="768" y="848" name="available" orien="R180" />
        <branch name="available">
            <wire x2="1136" y1="848" y2="848" x1="768" />
        </branch>
        <iomarker fontsize="80" x="784" y="1008" name="inst_valid" orien="R180" />
        <branch name="inst_valid">
            <wire x2="1152" y1="1008" y2="1008" x1="784" />
        </branch>
        <branch name="V_commit">
            <wire x2="1184" y1="2208" y2="2208" x1="688" />
            <wire x2="1184" y1="1168" y2="2208" x1="1184" />
        </branch>
        <iomarker fontsize="80" x="688" y="2208" name="V_commit" orien="R180" />
        <iomarker fontsize="80" x="4640" y="1216" name="cdb_Q" orien="R270" />
        <iomarker fontsize="80" x="4480" y="1216" name="cdb_valid" orien="R270" />
        <iomarker fontsize="80" x="4800" y="1216" name="cdb_value" orien="R270" />
        <branch name="cdb_valid">
            <wire x2="4480" y1="1216" y2="1472" x1="4480" />
        </branch>
        <branch name="cdb_Q">
            <wire x2="4640" y1="1216" y2="1472" x1="4640" />
        </branch>
        <branch name="cdb_value">
            <wire x2="4800" y1="1216" y2="1472" x1="4800" />
        </branch>
        <iomarker fontsize="80" x="2880" y="1120" name="Ri" orien="R270" />
        <iomarker fontsize="80" x="3200" y="1120" name="Rk" orien="R270" />
        <iomarker fontsize="80" x="3360" y="1120" name="Fu_type" orien="R270" />
        <branch name="Ri">
            <wire x2="2880" y1="1120" y2="1472" x1="2880" />
        </branch>
        <branch name="Rk">
            <wire x2="3200" y1="1120" y2="1472" x1="3200" />
        </branch>
        <branch name="Fu_type">
            <wire x2="3360" y1="1120" y2="1472" x1="3360" />
        </branch>
        <iomarker fontsize="80" x="3040" y="1120" name="Rj" orien="R270" />
        <branch name="Rj">
            <wire x2="3040" y1="1120" y2="1472" x1="3040" />
        </branch>
        <instance x="5328" y="3456" name="XLXI_17" orien="R90" />
        <instance x="4448" y="3456" name="XLXI_5" orien="R90" />
        <instance x="2384" y="3456" name="XLXI_18" orien="R90" />
        <instance x="3264" y="3456" name="XLXI_19" orien="R90" />
        <branch name="Qk">
            <wire x2="5840" y1="3776" y2="3808" x1="5840" />
        </branch>
        <branch name="forward_data_k">
            <wire x2="4960" y1="3776" y2="3808" x1="4960" />
        </branch>
        <branch name="forward_data_j">
            <wire x2="2896" y1="3776" y2="3808" x1="2896" />
        </branch>
        <branch name="Qj">
            <wire x2="3776" y1="3776" y2="3808" x1="3776" />
        </branch>
        <branch name="tag_issue">
            <wire x2="1856" y1="3776" y2="3808" x1="1856" />
        </branch>
        <instance x="1344" y="3456" name="XLXI_14" orien="R90" />
        <iomarker fontsize="80" x="5840" y="3808" name="Qk" orien="R90" />
        <iomarker fontsize="80" x="4960" y="3808" name="forward_data_k" orien="R90" />
        <iomarker fontsize="80" x="2896" y="3808" name="forward_data_j" orien="R90" />
        <iomarker fontsize="80" x="3776" y="3808" name="Qj" orien="R90" />
        <iomarker fontsize="80" x="1856" y="3808" name="tag_issue" orien="R90" />
        <branch name="XLXN_13">
            <wire x2="1520" y1="1168" y2="1168" x1="1504" />
            <wire x2="1504" y1="1168" y2="3456" x1="1504" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="3552" y1="2800" y2="2800" x1="1632" />
            <wire x2="5616" y1="2800" y2="2800" x1="3552" />
            <wire x2="5616" y1="2800" y2="3456" x1="5616" />
            <wire x2="3552" y1="2800" y2="3456" x1="3552" />
            <wire x2="1632" y1="2800" y2="3456" x1="1632" />
            <wire x2="3552" y1="1712" y2="2800" x1="3552" />
        </branch>
        <instance x="5712" y="1920" name="XLXI_8" orien="M180" />
        <branch name="XLXN_14">
            <wire x2="2080" y1="1168" y2="2080" x1="2080" />
            <wire x2="5712" y1="2080" y2="2080" x1="2080" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="4672" y1="1712" y2="2208" x1="4672" />
            <wire x2="5712" y1="2208" y2="2208" x1="4672" />
        </branch>
        <iomarker fontsize="80" x="6096" y="2432" name="PC_exception" orien="R0" />
        <iomarker fontsize="80" x="2304" y="3664" name="forward_control_j" orien="R90" />
        <branch name="forward_control_j">
            <wire x2="1792" y1="1168" y2="3184" x1="1792" />
            <wire x2="2304" y1="3184" y2="3184" x1="1792" />
            <wire x2="2304" y1="3184" y2="3664" x1="2304" />
        </branch>
        <iomarker fontsize="80" x="4320" y="3664" name="forward_control_k" orien="R90" />
        <branch name="forward_control_k">
            <wire x2="1984" y1="1168" y2="3008" x1="1984" />
            <wire x2="4320" y1="3008" y2="3008" x1="1984" />
            <wire x2="4320" y1="3008" y2="3664" x1="4320" />
        </branch>
    </sheet>
</drawing>