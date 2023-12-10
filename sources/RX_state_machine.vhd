----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2023 11:47:43 AM
-- Design Name: 
-- Module Name: state_machine_rx - Behavioral
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

entity state_machine_rx is
    port(
    Clk : in std_logic;
    uart_rx : in std_logic;
    bauderate_out : in std_logic;
    data_valid: out std_logic;
    data : out std_logic_vector(7 downto 0)
    );
end state_machine_rx;

architecture Behavioral of state_machine_rx is

type state_t is (idle, S0, S1, S2, S3, S4, S5, S6, S7, stop); 
signal state : state_t;

begin

process(Clk) is 
begin

    if rising_edge(Clk) then
    
        case state is    
        
            when idle =>    if uart_rx = '0' then
                                state <= S0;
                                data_valid <= '0';
                            end if;
                         
            when S0 =>      if bauderate_out = '1' then
                                state <= S1;
                                data(0) <= uart_rx;
                            end if;     
                            
            when S1 =>      if bauderate_out = '1' then
                                state <= S2;
                                data(1) <= uart_rx;
                            end if;    
                                                                       
            when S2 =>      if bauderate_out = '1' then
                                state <= S3;
                                data(2) <= uart_rx;
                            end if;   

            when S3 =>      if bauderate_out = '1' then
                                state <= S4;
                                data(3) <= uart_rx;
                            end if;    
                                                                       
            when S4 =>      if bauderate_out = '1' then
                                state <= S5;
                                data(4) <= uart_rx;
                            end if; 
                            
            when S5 =>      if bauderate_out = '1' then
                                state <= S6;
                                data(5) <= uart_rx;
                            end if;    
                                                                       
            when S6 =>      if bauderate_out = '1' then
                                state <= S7;
                                data(6) <= uart_rx;
                            end if;   

            when S7 =>      if bauderate_out = '1' then
                                state <= stop;
                                data(7) <= uart_rx;
                                data_valid <= '1';
                            end if;    
                                                                       
            when stop =>      if bauderate_out = '1' then
                                state <= idle;
                                data_valid <= '0';
                            end if;  
                            
            when others => state <= idle;
            
        end case;
    end if;   
end process;
                        
end Behavioral;
