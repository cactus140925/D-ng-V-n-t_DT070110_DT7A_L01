----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 07:54:57 AM
-- Design Name: 
-- Module Name: bai5 - Behavioral
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

entity bai5 is
--  Port ( );
Port (CLK: in STD_LOGIC;
        Q_out: out STD_LOGIC_VECTOR (2 downto 0));
end bai5;

architecture Behavioral of bai5 is
component T_FF is
    Port ( T : in STD_LOGIC;
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
  signal t0, t1, t2 : STD_LOGIC;
begin
  t0 <= '1';
  
  t1 <= q0_inv and (q1 or q2);
  
  t2 <= q0_inv and q1_inv;

   
   
   FF2: T_FF  port map (
   T => t2,
   CLK =>CLK,
   Q => q2,
   Q_inv => q2_inv);
   
   
   FF1: T_FF  port map (
   T => t1,
   CLK =>CLK,
   Q => q1,
   Q_inv => q1_inv);
   
   
   FF0: T_FF  port map (
   T => t0,
   CLK =>CLK,
   Q => q0,
   Q_inv => q0_inv);
   
   Q_out(2) <= q2;
   Q_out(1) <= q1;
   Q_out(0) <= q0;


end Behavioral;
