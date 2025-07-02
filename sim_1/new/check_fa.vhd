----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/18/2025 08:47:17 AM
-- Design Name: 
-- Module Name: check_fa - Behavioral
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

entity check_fa is
--  Port ( );
end check_fa;

architecture Behavioral of check_fa is
component full_add is
 Port(     a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin: in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
           end component;
signal a: std_logic:= '0';
signal b: std_logic:= '0';
signal cin : std_logic:= '0';
signal s: std_logic;
signal cout: std_logic;

begin
fulladd: full_add port map ( a => a, b =>b,cin=>cin , s =>s, cout=>cout);
checkfa: process
begin
  wait for 10ns;
  a <= '0'; b <= '0'; cin <= '0';
  wait for 10ns;
  a <= '0'; b <= '0'; cin <='1';
  wait for 10ns;
  a <= '0'; b <= '1'; cin <= '0';
  wait for 10ns;
  a <= '0'; b <= '1'; cin <= '1';
  wait for 10ns;
  a <= '1'; b <= '0'; cin  <= '0';
  wait for 10ns;
  a <= '1'; b <= '0'; cin <= '1';
  wait for 10ns;
  a <= '1'; b <= '1'; cin <= '0';
  wait for 10ns;
  a <= '1'; b <= '1'; cin <= '1';
end process;

end Behavioral;
