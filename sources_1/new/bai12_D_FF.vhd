----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 01:06:55 PM
-- Design Name: 
-- Module Name: bai12_D_FF - Behavioral
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

entity bai12_D_FF is
Port (
        clk    : in  STD_LOGIC;
        Q      : buffer STD_LOGIC_VECTOR(3 downto 0):="0000";
        Q_inv  : buffer STD_LOGIC_VECTOR(3 downto 0):="0000";
        y      : out STD_LOGIC
    );
end bai12_D_FF;

architecture Behavioral of bai12_D_FF is
component D_FF
        Port (
            D     : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC
        );
    end component;
 
    signal D: STD_LOGIC_VECTOR(3 downto 0);
begin
  D(0) <= Q_inv(1) or (Q(1) and Q_inv(3)) or (Q(3) and Q_inv(2));
  D(1) <= Q(1) and Q_inv(0);
  D(2) <= Q(2) xor Q(1);
  D(3) <= (Q(3) and Q_inv(2)) or (Q(3) and Q_inv(1)) or (Q_inv(3)and Q(2) and Q(1));
  FF0: D_FF port map (
        CLK => clk,
        Q => Q(0),
        D => D(0),
        Q_inv => Q_inv(0)
    );
   FF1: D_FF port map (
        CLK => clk,
        Q => Q(1),
        D => D(1),
        Q_inv => Q_inv(1)
    );
    FF2: D_FF port map (
        CLK => clk,
        Q => Q(2),
        D => D(2),
        Q_inv => Q_inv(2)
    );
    FF3: D_FF port map (
        CLK => clk,
        Q => Q(3),
        D => D(3),
        Q_inv => Q_inv(3)
    );
    y <= '1' when Q = "000" else '0';
end Behavioral;
