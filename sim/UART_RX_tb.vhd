----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2023 05:00:10 PM
-- Design Name: 
-- Module Name: UART_RX_tb - Behavioral
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

entity UART_RX_tb is
--  Port ( );
end UART_RX_tb;

architecture Behavioral of UART_RX_tb is

component UART_RX is    
    port(
    Clk : in std_logic;
    uart_rx: in std_logic;
    data_valid : out std_logic;
    data : out std_logic_vector(7 downto 0)
    );
end component;

signal clk : std_logic := '0';
signal uart_rx_input: std_logic;
signal data_valid : std_logic;
signal data: std_logic_vector(7 downto 0);
constant clk_period : time := 10ns;

begin

uart_rx_s: UART_RX
    port map(
    Clk => clk,
    uart_rx => uart_rx_input,
    data_valid => data_valid,
    data => data
    );
    
clk <= not clk after clk_period/2;

process 
begin
    wait for clk_period;
    uart_rx_input <= '0';
    
    wait for 5*clk_period;
    uart_rx_input <= '1';
    
    wait for 5*clk_period;
    uart_rx_input <= '0';
    
    wait for 5*clk_period;
    uart_rx_input <= '1';
    
    wait for 5*clk_period;
    uart_rx_input <= '0';
    
    wait for 5*clk_period;
    uart_rx_input <= '1';
    
    wait for 5*clk_period;
    uart_rx_input <= '0';
    
    wait for 5*clk_period;
    uart_rx_input <= '1';
    
    wait for 5*clk_period;
    uart_rx_input <= '0';
    
    wait for 5*clk_period;
    uart_rx_input <= '1';
   
    wait;
end process;

end Behavioral;
