----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2025 07:36:12 AM
-- Design Name: 
-- Module Name: fa_4bit - Behavioral
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

entity fa_4bit is
    Port ( a : in std_logic_vector(3 downto 0);
           b : in std_logic_vector(3 downto 0);
           s : out std_logic_vector(3 downto 0);
           cout : out std_logic
           );
end fa_4bit;

architecture Behavioral of fa_4bit is

component half_add is
 Port(     a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
           end component;

component full_add is
 Port(     a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin: in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
           end component;

    signal c0, c1, c2: std_logic;
begin
HA0: half_add port map (
  a => a(0),
  b => b(0),
  s => s(0),
  cout => c0);

FA1: full_add port map (
  a => a(1),
  b => b(1),
  s => s(1),
  cin => c0,
  cout => c1);
  
FA2: full_add port map (
  a => a(2),
  b => b(2),
  s => s(2),
  cin => c1,
  cout => c2);
  
FA3: full_add port map (
  a => a(3),
  b => b(3),
  s => s(3),
  cin => c2,
  cout => cout);

end Behavioral;
