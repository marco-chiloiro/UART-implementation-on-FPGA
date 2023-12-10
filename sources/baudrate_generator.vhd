----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2023 11:23:02 AM
-- Design Name: 
-- Module Name: Bauder rate generator - Behavioral
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

entity Baud_rate_generator is
    port(
        Clk : in std_logic;
        baudrate_out : out std_logic
        );
end Baud_rate_generator;
    
architecture Behavioral of Baud_rate_generator is
    
begin

process(Clk)
    variable count : integer :=0;
    variable clk_period : integer := 5;
    
    begin
    if(rising_edge(Clk)) then 
        baudrate_out <= '0';
        count := count + 1;
        if(count = clk_period) then
            baudrate_out <= '1';
            count := 0;
        end if;
    end if;
end process;
            
end Behavioral;
