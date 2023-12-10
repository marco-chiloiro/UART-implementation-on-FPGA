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

entity pulse_generator is
    port(
        Clk : in std_logic;
        Enable : in std_logic;
        Pulse : out std_logic 
        );
end pulse_generator;
    
architecture Behavioral of pulse_generator is
    
begin

process(Clk)
    -- how many clock cycles correspond to one bauder clock cycle?
    variable clk_period : integer := 5;
    -- wait half period
    variable count : integer := -clk_period/2;
    
    begin
    if(rising_edge(Clk)) then 
        if Enable='1' then
            Pulse <= '0';
            count := count + 1;
            if(count = clk_period) then
                Pulse <= '1';
                count := 0;
            end if;
        end if;           
    end if;
end process;
            
end Behavioral;
