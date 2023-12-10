----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2023 11:12:23 AM
-- Design Name: 
-- Module Name: UART_sim - Behavioral
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

entity UART_TX_tb is
--  Port ( );
end UART_TX_tb;

architecture Behavioral of UART_TX_tb is

component UART_TX is
    port(
    Clk : in std_logic;
    data_valid : in std_logic;
    data : in std_logic_vector(7 downto 0) ;
    uart_tx : out std_logic;
    busy : out std_logic
    );
end component;

signal clk : std_logic := '0';
signal data_valid : std_logic := '0';
signal data : std_logic_vector(7 downto 0);
signal uart_tx_sign : std_logic;
signal busy: std_logic;
constant clk_period : time := 10ns;

begin

uart_tx_tb : UART_TX
        port map(
        Clk => clk,
        data_valid => data_valid,
        data => data,
        uart_tx => uart_tx_sign,
        busy => busy
    );

clk <= not clk after clk_period/2;

process
    begin
    data <= "10101110";
    wait for 10ns;
    data_valid <= '1';
    wait for 50ns;
    data_valid <= '0';
    wait;
end process;

end Behavioral;
