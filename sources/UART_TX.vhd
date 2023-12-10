----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2023 11:17:30 AM
-- Design Name: 
-- Module Name: UART - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_TX is
    port(
    Clk : in std_logic;
    data_valid : in std_logic;
    data : in std_logic_vector(7 downto 0) ;
    uart_tx : out std_logic;
    busy : out std_logic
    );
end UART_TX;

architecture Behavioral of UART_TX is

component Baud_rate_generator is
    port(
    Clk : in std_logic;
    baudrate_out: out std_logic
    );
end component;

component TX_state_machine is
    port(
    Clk : in std_logic;
    Baudrate_out : in std_logic;
    data_valid : in std_logic;
    data : in std_logic_vector(7 downto 0);
    busy : out std_logic;
    uart_tx : out std_logic 
    );
end component;

signal y : std_logic;

begin 

Baud_rate_generator_inst : Baud_rate_generator
    port map(
    Clk => Clk,
    baudrate_out => y
    );
    
TX_state_machine_inst : TX_state_machine
    port map(
    Clk => Clk,
    baudrate_out => y,
    data_valid => data_valid,
    data => data,
    busy => busy,
    uart_tx => uart_tx
    );

end Behavioral;
