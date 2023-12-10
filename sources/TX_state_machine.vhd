----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2023 12:11:27 PM
-- Design Name: 
-- Module Name: TX_state_machine - Behavioral
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

entity TX_state_machine is
    port(
        Clk : in std_logic;
        Baudrate_out : in std_logic;
        data_valid : in std_logic;
        data : in std_logic_vector(7 downto 0);
        busy : out std_logic;
        uart_tx : out std_logic 
    );
end TX_state_machine;

architecture Behavioral of TX_state_machine is

type state_t is (idle, valid_state, start, S0, S1, S2, S3, S4, S5, S6, S7, stop);
signal state : state_t;

begin

process(Clk) is
begin
    if rising_edge(Clk) then
        
        case state is  
        
            when idle =>        if data_valid = '1' then
                                    state <= valid_state;
                                    busy <= '1';
                                else
                                    busy <= '0';
                                end if;
               
            when valid_state => if (Baudrate_out = '1') then
                                    state <= start; 
                                    uart_tx <= '0';
                                end if;
                                
            when start =>       if (Baudrate_out = '1') then
                                    state <= S0;
                                    uart_tx <= data(0);   
                                end if;  
                          
            when S0 =>          if (Baudrate_out = '1') then
                                    state <= S1;
                                    uart_tx <= data(1);      
                                end if;
                                                 
            when S1 =>          if (Baudrate_out = '1') then
                                    state <= S2;
                                    uart_tx <= data(2);  
                                end if;
                          
            when S2 =>          if (Baudrate_out = '1') then
                                    state <= S3;
                                    uart_tx <= data(3);
                                end if;
                          
            when S3 =>          if (Baudrate_out = '1') then
                                    state <= S4;
                                    uart_tx <= data(4);
                                end if;
                          
            when S4 =>          if (Baudrate_out = '1') then
                                    state <= S5;
                                    uart_tx <= data(5);  
                                end if;
                          
            when S5 =>          if (Baudrate_out = '1') then
                                    state <= S6;
                                    uart_tx <= data(6); 
                                end if;
                          
            when S6 =>          if (Baudrate_out = '1') then
                                    state <= S7;
                                    uart_tx <= data(7); 
                                end if;
                          
            when S7 =>          if (Baudrate_out = '1') then
                                    state <= stop;
                                    uart_tx <= '1';    
                                end if; 
                           
            when stop =>        if (Baudrate_out = '1') then
                                    state <= idle;    
                                end if;
            
            when others =>      state <= idle;   
        end case;
    end if; 
end process;    
                                                 
end Behavioral;
