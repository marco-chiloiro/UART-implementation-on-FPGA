----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2023 05:36:29 PM
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

entity UART is 
    port(
    Clk : in std_logic;
    USB_in : in std_logic;
    USB_out : out std_logic;
    busy : out std_logic
    ); 
end UART;


architecture Behavioral of UART is

component UART_RX is
    Port( 
    Clk : in std_logic;
    uart_rx: in std_logic;
    data_valid : out std_logic;
    data : out std_logic_vector(7 downto 0)
    );
end component;

component UART_TX is
    port(
    Clk : in std_logic;
    data_valid : in std_logic;
    data : in std_logic_vector(7 downto 0) ;
    uart_tx : out std_logic;
    busy : out std_logic
    );
end component;

signal valid_sign : std_logic;
signal data_sign : std_logic_vector(7 downto 0);

begin

UART_RX_inst : UART_RX
    port map(
    Clk => Clk,
    uart_rx => USB_in,
    data_valid => valid_sign,
    data => data_sign
    );
    
UART_TX_inst : UART_TX
    port map(
    Clk => Clk,
    data_valid => valid_sign,
    data => data_sign,
    uart_tx => USB_out,
    busy => busy
    );
    
end Behavioral;
