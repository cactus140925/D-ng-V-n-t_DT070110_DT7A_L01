----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 08:29:32 AM
-- Design Name: 
-- Module Name: bai6 - Behavioral
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

entity bai6 is
--  Port ( );
Port (CLK: in STD_LOGIC;
        Q_out: out STD_LOGIC_VECTOR (2 downto 0));
end bai6;

architecture Behavioral of bai6 is
component JK_FF is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : buffer STD_LOGIC;
           Q_inv : buffer STD_LOGIC);
end component;
  signal q0 : STD_LOGIC := '0';
  signal q1 : STD_LOGIC := '0';
  signal q2 : STD_LOGIC := '0';
  signal q0_inv : STD_LOGIC;
  signal q1_inv : STD_LOGIC;
  signal q2_inv : STD_LOGIC; 
  signal j0, k0, j1, k1, j2, k2 : STD_LOGIC;
begin

  j0 <= q0_inv and (q2 or q1);
  k0 <= q0 and (q2_inv or q1_inv);

  j1 <= q1_inv and q0_inv;
  k1 <= q1 and q0_inv;

  j2 <= q2_inv and q1_inv and q0_inv;
  k2 <= q2 and q1_inv and q0_inv;
   
   
   FF2: JK_FF  port map (
   J => j2,
   K => k2,
   CLK =>CLK,
   Q => q2,
   Q_inv => q2_inv);
   
   
   FF1: JK_FF  port map (
   J => j1,
   K => k1,
   CLK =>CLK,
   Q => q1,
   Q_inv => q1_inv);
   
   
   FF0: JK_FF  port map (
   J => j0,
   K => k0,
   CLK =>CLK,
   Q => q0,
   Q_inv => q0_inv);
   
   Q_out(2) <= q2;
   Q_out(1) <= q1;
   Q_out(0) <= q0;
end Behavioral;