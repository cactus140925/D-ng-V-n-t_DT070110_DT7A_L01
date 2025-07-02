----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2025 04:24:49 PM
-- Design Name: 
-- Module Name: JKFF - Behavioral
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

entity JK_FF is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           CLK: in std_logic;
           Q: out std_logic;
           Qn : out STD_LOGIC);
end JK_FF;
architecture Behavioral of JK_FF is
   signal q_0: std_logic := '0';
begin
process(CLK)
 begin
 if rising_edge(CLK) then
  case (J & K) is
 when "00" => q_0 <= q_0;
 when "01" => q_0 <= '0';
 when "11" => q_0 <= not(q_0);
 when "10" => q_0 <= '1';
 when others => q_0 <= '0';
  end case;
 end if;
 end process;
    Q <= q_0;
    Qn <= not q_0;

end Behavioral;
