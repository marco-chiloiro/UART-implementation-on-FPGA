----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 11:57:41 AM
-- Design Name: 
-- Module Name: UART_RX - Behavioral
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

entity UART_RX is
    Port( 
    Clk : in std_logic;
    uart_rx: in std_logic;
    data_valid : out std_logic;
    data : out std_logic_vector(7 downto 0)
    );
end UART_RX;


architecture Behavioral of UART_RX is

component Sampler_generator is
    port(
    Clk : in std_logic;
    uart_rx : in std_logic;
    bauderate_out : out std_logic
    );
end component;


component state_machine_rx is
    port(
    Clk : in std_logic;
    uart_rx : in std_logic;
    bauderate_out : in std_logic;
    data_valid: out std_logic;
    data : out std_logic_vector(7 downto 0)
    );
end component;  

signal y : std_logic;

begin

sampler_generator_inst : Sampler_generator 
    port map(
    Clk => Clk,
    uart_rx => uart_rx,
    bauderate_out => y
    ); 

state_machine_rx_inst : state_machine_rx
    port map(
    Clk => Clk,
    uart_rx => uart_rx,
    bauderate_out => y,
    data_valid => data_valid,
    data => data
    );    

end Behavioral;
