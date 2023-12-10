----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2023 03:24:26 PM
-- Design Name: 
-- Module Name: Sampler_generator - Behavioral
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

entity Sampler_generator is
    port(
    Clk : in std_logic;
    uart_rx : in std_logic;
    bauderate_out : out std_logic
    );
end Sampler_generator;



architecture Behavioral of Sampler_generator is

component pulse_generator is 
    port(
    Clk : in std_logic;
    Enable : in std_logic;
    Pulse : out std_logic := '0'
    );
end component;

component state_machine_sampler is     
    port(
    Clk : in std_logic;
    uart_rx : in std_logic;
    Pulse : in std_logic;
    Enable : out std_logic := '0'
    );
end component;

signal y : std_logic;
signal r : std_logic;

begin

pulse_generator_inst : pulse_generator
    port map(
    Clk => Clk,
    Enable => y,
    Pulse => r
    );
    
bauderate_out <= r;

state_machine_sampler_inst : state_machine_sampler
    port map(
    Clk => Clk,
    uart_rx => uart_rx,
    Pulse => r, 
    Enable => y
    );
    
end Behavioral;
