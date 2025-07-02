----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 09:01:26 PM
-- Design Name: 
-- Module Name: Bai3 - Behavioral
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

entity Bai3 is
Port (
        clk    : in  STD_LOGIC;
        Q      : buffer STD_LOGIC_VECTOR(2 downto 0);
        Q_inv  : buffer STD_LOGIC_VECTOR(2 downto 0);
        y      : out STD_LOGIC
    );
end Bai3;

architecture Behavioral of Bai3 is
component JK_FF is
  Port (
        J, K  : in STD_LOGIC;
            CLK   : in STD_LOGIC;
            Q     : buffer STD_LOGIC;
            Q_inv : buffer STD_LOGIC);
            end component;
            
            signal J,K : std_logic_vector(2 downto 0);
begin
    J(0) <= '1';
    K(0) <= '1';

    J(1) <= Q(0) and not Q(2);
    K(1) <= Q(0);

    J(2) <= Q(0) and Q(1);
    K(2) <= Q(0) and Q(1);


    FF1: JK_FF port map
    (J=>J(0),K=> K(0),clk=> clk,Q=> Q(0),Q_inv=> Q_inv(0));
   
   FF2: JK_FF port map(
   J=>J(1),K=> K(1),clk=> clk,Q=> Q(1),Q_inv=> Q_inv(1));
   
    FF3: JK_FF port map(
    J=>J(2),K=> K(2),clk=> clk,Q=> Q(2),Q_inv=> Q_inv(2));

    y <= Q(0) and Q(2);

end Behavioral;