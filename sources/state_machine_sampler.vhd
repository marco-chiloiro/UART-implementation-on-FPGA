----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2023 11:09:53 AM
-- Design Name: 
-- Module Name: state_machine_sampler - Behavioral
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

entity state_machine_sampler is
    port(
    Clk : in std_logic;
    uart_rx : in std_logic;
    Pulse : in std_logic;
    Enable : out std_logic := '0'
   );
end state_machine_sampler;

architecture Behavioral of state_machine_sampler is

type state_t is (idle, S0, S1, S2, S3, S4, S5, S6, S7, S8);
signal state: state_t;

begin

process(Clk) is
begin

    if rising_edge(Clk) then 
    
        case state is
        
            when idle => if uart_rx = '0' then 
                            state <= S0;
                            Enable <= '1';
                         end if;
            
            when S0 =>   if Pulse = '1' then
                            state <= S1;
                         end if;
                            
            when S1 =>   if Pulse = '1' then
                            state <= S2;
                         end if;
                            
            when S2 =>   if Pulse = '1' then
                            state <= S3;
                         end if;
                         
            when S3 =>   if Pulse = '1' then
                            state <= S4;
                         end if;
                            
            when S4 =>   if Pulse = '1' then
                            state <= S5;
                         end if;
                            
            when S5 =>   if Pulse = '1' then
                            state <= S6;
                         end if;
                            
            when S6 =>   if Pulse = '1' then
                            state <= S7;
                         end if;
                            
            when S7 =>   if Pulse = '1' then
                            state <= S8;
                         end if;
                         
            when S8 =>   if Pulse = '1' then
                            state <= idle;
                            enable <= '0';
                         end if;
                         
            when others => state <= idle;    
        end case;                                                                                          
    end if;                                                                
end process;


end Behavioral;
