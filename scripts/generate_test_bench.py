# !/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Biong. Leandro D. Medus
Ph.D Student GPDD - ETSE
Universitat de València
leandro.d.medus@uv.es

11-05-2020

Script Description:
-------------------
This is a Script to generate a testbench automatically from a custom VHDL module.

Version: 1.5
------------

TODO:
    - generics not supported yet
"""

import re
import sys

# prefix for the new generated file
testbench_prefix = "tb_"

# regex to split files names and absolute or relative paths
regex_path = re.compile(r'([\w|\\|//|\:|.]*\\)*(\w*)(.vhd)', re.I)

# capture all the header description from the source file
regex_header = re.compile(r'(--.*)', re.I)

# regex for libraries
regex_libraries = re.compile(r'(library\s\w*;| *use\s\w*.\w*.all;)', re.I)

# regex expression to get the entity name
regex_entity = re.compile(r'\s*entity+\s+(\w+)\s+is\s*', re.I)

# regex expression to get all the ports description
# this gets the current data ports organized as:  port_name, direction, type
regex_ports = re.compile(r'\s*(\w+)\s*\:\s*(in|out|inout)\s*([[\w| ]*[\(|\)]*[\w| ]*[\(|\)]*);*', re.I)

PORT_NAME_ID = 0  # data position in the regex_ports list
PORT_DIR_ID = 1  # data position in the regex_ports list
PORT_TYPE_ID = 2  # data position in the regex_ports list

# specific clock ports
regex_clk = re.compile(r'(\w*clk\w*|\w*clock\w*)', re.I)

# specific reset ports
regex_rst = re.compile(r'(\w*rst\w*|\w*reset\w*)', re.I)


def test_regex(line):
    """
    dummy function to test the regex
    :param line:
    :return:
    """
    regex = re.compile(r'\s*(\w+)\s*\:\s*(in|out|inout)\s*([\w|\s]*).*', re.I)
    result = regex.findall(line)

    if result:
        print(result[0])


def generate_test_bench(file_path):
    """
    Main function to generate a testbench from a VHDL source file. The script takes the input path of the file and
    generates a new file in that directory with a prefix defined by testbench_prefix.
    :param file_path: path to the .vhd file
    :return: nothing
    """

    output_file_path = get_output_file_path(file_path)
    # print(output_file_path)

    with open(file_path) as fd:
        entity_name = None
        header_description = list()
        libraries = list()

        data = list()
        for line in fd:

            if entity_name is None:
                # look for header
                result = regex_header.findall(line)
                if result:
                    header_description.append(result[0])

                # look for libraries
                result = regex_libraries.findall(line)
                if result:
                    libraries.append(result[0])

                # look for entity name
                result = regex_entity.findall(line)

                if result:
                    entity_name = result[0]

            if entity_name:
                # result = regex_ports.findall(line.lower())
                result = regex_ports.findall(line)
                result = list(result[0]) if result else None

                if result:
                    data.append(result)

        write_testbench(output_file_path, entity_name, data, header_description, libraries)


def get_output_file_path(file_path):
    """

    :param file_path:
    :return: output file path of the new file
    """
    output_file_ph = ""

    result = regex_path.findall(file_path)
    result = list(result[0]) if result else None

    args = len(result)

    if args == 2:  # file name + extension file
        output_file_ph = testbench_prefix + result[0] + result[1]
    else:
        if args == 3:  # path + file name + extension file
            output_file_ph = result[0] + testbench_prefix + result[1] + result[2]
        else:
            print("Error: arguments in file path!")

    return output_file_ph


def write_testbench(output_file_path, entity_name, data_ports, header, libraries):
    """

    :param output_file_path:
    :param entity_name: entity name of the selected design
    :param data_ports: list of ports
    :param header: header description of the file
    :param libraries: libraries used
    :return: nothing
    """

    with open(output_file_path, "w") as fd_o:
        for line in header:
            fd_o.write(line + '\n')

        for line in libraries:
            fd_o.write(line + '\n')
        fd_o.write('\n')

        str_body = set_body(entity_name, data_ports)

        for line in str_body:
            fd_o.write(line)


def set_body(entity_name, port_data):
    """

    :param entity_name:
    :param port_data:
    :return: string
    """
    ports_in = list()
    ports_out = list()
    ports_inout = list()

    clk_port_name = "clk"
    rst_port_name = "rst_n"

    clk_port_present = False
    rst_port_present = False

    for port in port_data:
        if port[PORT_DIR_ID] == "in":
            ports_in.append(port)

        if port[PORT_DIR_ID] == "out":
            ports_out.append(port)

        if port[PORT_DIR_ID] == "inout":
            ports_inout.append(port)

    n_ports = len(port_data)

    str_body = """entity tb_""" + entity_name + """ is
    end tb_""" + entity_name + """;


    architecture behavioral of tb_""" + entity_name + """ is

    -- component declarations
    component """ + entity_name + """
        port(\n"""


    # ports declarations
    port_ctr = 0

    str_body += "\t\t\t-- input ports\n"
    for port in ports_in:
        str_body += "\t\t\t" + port[PORT_NAME_ID] + "\t\t: " + port[PORT_DIR_ID] + "\t" + port[PORT_TYPE_ID]
        port_ctr += 1
        if port_ctr < n_ports:
            str_body += ';\n'
        else:
            str_body += '\n'

    str_body += "\t\t\t-- output ports\n"
    for port in ports_out:
        str_body += "\t\t\t" + port[PORT_NAME_ID] + "\t\t: " + port[PORT_DIR_ID] + "\t" + port[PORT_TYPE_ID]
        port_ctr += 1
        if port_ctr < n_ports:
            str_body += ';\n'
        else:
            str_body += '\n'

    if ports_inout:
        str_body += "\t\t\t-- inout ports\n"
        for port in ports_inout:
            str_body += "\t\t\t" + port[PORT_NAME_ID] + "\t\t: " + port[PORT_DIR_ID] + "\t" + port[PORT_TYPE_ID] + ';\n'
            port_ctr += 1
            if port_ctr < n_ports:
                str_body += ';\n'
            else:
                str_body += '\n'

    str_body += """\t\t);
    end component;

    -- clock period definition
    constant c_CLK_PERIOD : time := 10 ns;

    """

    # signals declarations -----------------------------
    str_body += "-- input signals\n"

    # signal s_clk    : std_logic := '0';
    # signal s_rst_n  : std_logic := '0';\n"""

    # writing all the signals to connect to the current module
    module_signals_body = ""

    if ports_in:
        for port in ports_in:

            result = regex_clk.findall(port[PORT_NAME_ID])
            if result and not clk_port_present:
                clk_port_present = True
                clk_port_name = result[0]

            result = regex_rst.findall(port[PORT_NAME_ID])
            if result and not rst_port_present:
                rst_port_present = True
                rst_port_name = result[0]

            module_signals_body += "\tsignal s_" + port[PORT_NAME_ID] + "\t\t: " + port[PORT_TYPE_ID] + ';\n'

    if ports_out:
        module_signals_body += "\t-- output signals\n"
        for port in ports_out:
            module_signals_body += "\tsignal s_" + port[PORT_NAME_ID] + "\t\t: " + port[PORT_TYPE_ID] + ';\n'

    if ports_inout:
        module_signals_body += "\t-- inout signals\n"
        for port in ports_inout:
            module_signals_body += "\tsignal s_" + port[PORT_NAME_ID] + "\t\t: " + port[PORT_TYPE_ID] + ';\n'

    # if clock o reset signal are not present, then it will be included
    if not clk_port_present:
        str_body += "\tsignal s_clk\t: std_logic := '0';\n"

    if not rst_port_present:
        str_body += "\tsignal s_rst_n\t: std_logic := '0';\n"

    # adding now all the signals detected
    str_body += module_signals_body

    str_body += """begin

    -- instantiation of the Unit under test
    uut: """ + entity_name + """
    port map("""

    #  -----------------------------------------
    #  entity instantiation

    # signals declarations -----------------------------
    port_ctr = 0

    str_body += "\n\t\t-- input ports\n"
    for port in ports_in:
        str_body += "\t\t" + port[0] + "\t=> " + "s_" + port[0]
        port_ctr += 1
        if port_ctr < n_ports:
            str_body += ',\n'
        else:
            str_body += '\n'

    str_body += "\t\t-- output ports\n"
    for port in ports_out:
        str_body += "\t\t" + port[0] + "\t=> " + "s_" + port[0]
        port_ctr += 1
        if port_ctr < n_ports:
            str_body += ',\n'
        else:
            str_body += '\n'

    if ports_inout:
        str_body += "\t\t-- inout ports\n"
        for port in ports_inout:
            str_body += "\t\t" + port[0] + "\t=> " + "s_" + port[0]
            port_ctr += 1
            if port_ctr < n_ports:
                str_body += ',\n'
            else:
                str_body += '\n'

    str_body += "\t);\n\n"

    clk_stimulus = """\t-- Clock process definitions
    p_clk_process : process
    begin
        <clock_signal> <= '0';
        wait for c_CLK_PERIOD/2;
        <clock_signal> <= '1';
        wait for c_CLK_PERIOD/2;
    end process;\n"""

    clk_stimulus = clk_stimulus.replace("<clock_signal>", "s_" + clk_port_name)

    process_stimulus = """\n\t-- stimulus process
    p_stim : process
    begin
        <reset_signal> <= '0';
        wait for 40 ns;
        <reset_signal> <= '1';

        wait for c_CLK_PERIOD;

        -- add code here

        -- nothing else to do..
        wait for 3 * c_CLK_PERIOD;

        report "[msg] Testbench end." severity failure ;
    end process;


    end behavioral;
    """
    process_stimulus = process_stimulus.replace("<reset_signal>", "s_" + rst_port_name)

    str_body += clk_stimulus
    str_body += process_stimulus

    return str_body


if __name__ == '__main__':
    """
    main function
    """

    if len(sys.argv) == 2:
        path_to_file = sys.argv[1]
        generate_test_bench(path_to_file)
    else:
        print("Incorrect number of arguments")
        print('help: python generate_test_bench sample.vhd')

    print("Script executed successfully")
