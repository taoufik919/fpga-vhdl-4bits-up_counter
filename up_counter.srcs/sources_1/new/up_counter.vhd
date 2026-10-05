----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/03/2026 12:11:27 PM
-- Design Name: 
-- Module Name: up_counter - Behavioral
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
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity up_counter is
    Port ( clk : in STD_LOGIC;
           reset: in std_logic;
           counter: out std_logic_vector(3 downto 0) 
           );
end up_counter;

architecture Behavioral of up_counter is
    CONSTANT clk_1_pulse_divided : integer := 33333000 ;
    signal clk_counter : integer  := 0;
    signal counter_up : std_logic_vector (3 downto 0) := (others=>'0');
begin
--- 
process (clk)
    begin 
        if (rising_edge (clk)) then 
            if reset = '1' then
                counter_up <= x"0";
                elsif clk_counter = clk_1_pulse_divided -1 then
                    counter_up <= counter_up + x"1";
                    clk_counter <= 0;
                 else
                 clk_counter <= clk_counter +1; 
            end if;    
        end if;
        counter<=counter_up;
end process;

end Behavioral;
