----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2025 08:16:38 AM
-- Design Name: 
-- Module Name: check_ha - Behavioral
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

entity check_ha is
  
end check_ha;

architecture Behavioral of check_ha is
component half_add is
 Port(     a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
           end component;
signal a: std_logic:= '0';
signal b: std_logic:= '0';
signal s: std_logic;
signal cout: std_logic;

begin
halfadd: half_add port map (a => a, b =>b, s =>s, cout=>cout);

check: process
begin
  wait for 10ns;
  a<= '0'; b <= '1';
  wait for 10ns;
  a<= '1'; b <= '1';
  wait for 10ns;
  a<= '1'; b <= '0';
end process;

end Behavioral;
