----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 07:24:02 AM
-- Design Name: 
-- Module Name: tien_7 - Behavioral
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

entity tien_7 is
Port (
        clk    : in  STD_LOGIC;
        Q      : buffer STD_LOGIC_VECTOR(2 downto 0);
        Q_inv  : buffer STD_LOGIC_VECTOR(2 downto 0);
        y      : out STD_LOGIC
    );
end tien_7;

architecture Behavioral of tien_7 is
component T_FF is
      Port ( T : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : buffer STD_LOGIC;
           Q_inv : buffer STD_LOGIC);
           end component;
           
           signal T : STD_LOGIC_VECTOR(2 downto 0);
begin
T(0) <= not Q_inv(1) or not Q_inv(2);
T(1) <= Q(0);
T(2) <= Q(1);

TFF1: T_FF port map(T(0),CLK,Q(0),Q_inv(0));
TFF2: T_FF port map(T(1),CLK,Q(1),Q_inv(1));
TFF3: T_FF port map(T(2),CLK,Q(2),Q_inv(2));

y <= Q(0) and Q(1) and Q(2) ;
end Behavioral;

