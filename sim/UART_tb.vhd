----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 05:54:16 PM
-- Design Name: 
-- Module Name: UART_tb - Behavioral
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

entity UART_tb is
--  Port ( );
end UART_tb;

architecture Behavioral of UART_tb is

component UART is 
    port(
    Clk : in std_logic;
    USB_in : in std_logic;
    USB_out : out std_logic;
    busy : out std_logic
    ); 
end component;

signal clk : std_logic := '0';
signal USB_in_sign: std_logic;
signal USB_out_sign : std_logic;
signal busy_sign : std_logic;
constant clk_period : time := 10ns;

begin

UART_tb_inst: UART
    port map(
    Clk => clk,
    USB_in => USB_in_sign,
    USB_out => USB_out_sign,
    busy => busy_sign
    );
clk <= not clk after clk_period/2;

process 
begin
-- start bit! always 0
    wait for clk_period;
    USB_in_sign <= '0';
    
    wait for 5*clk_period;
    USB_in_sign <= '1';
    
    wait for 5*clk_period;
    USB_in_sign <= '1';
    
    wait for 5*clk_period;
    USB_in_sign <= '1';
    
    wait for 5*clk_period;
    USB_in_sign <= '0';
    
    wait for 5*clk_period;
    USB_in_sign <= '1';
    
    wait for 5*clk_period;
    USB_in_sign <= '0';
    
    wait for 5*clk_period;
    USB_in_sign <= '1';
    
    wait for 5*clk_period;
    USB_in_sign <= '0';
    
    wait for 5*clk_period;
    USB_in_sign <= '1';
   
    wait;

end process;
end Behavioral;
