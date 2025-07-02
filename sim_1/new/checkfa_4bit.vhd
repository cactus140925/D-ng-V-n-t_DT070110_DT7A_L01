----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2025 07:45:33 AM
-- Design Name: 
-- Module Name: checkfa_4bit - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity checkfa_4bit is
end checkfa_4bit;

architecture Behavioral of checkfa_4bit is

    -- Component declaration
    component fa_4bit
        Port ( 
            a    : in  std_logic_vector(3 downto 0);
            b    : in  std_logic_vector(3 downto 0);
            s    : out std_logic_vector(3 downto 0);
            cout  : out std_logic
        );
    end component;
    signal a_tb, b_tb : std_logic_vector(3 downto 0);
    signal s_tb       : std_logic_vector(3 downto 0);
    signal cout_tb     : std_logic;

begin
    add4bit: fa_4bit port map (
        a => a_tb,
        b => b_tb,
        s => s_tb,
        cout => cout_tb);
        
    check: process
    begin
        a_tb <= "0011";
        b_tb <= "0010";
        wait for 10 ns;
        a_tb <= "0111"; 
        b_tb <= "1000"; 
        wait for 10 ns;
        a_tb <= "1111"; 
        b_tb <= "0001"; 
        wait for 10 ns;
        a_tb <= "0000";
        b_tb <= "0000";
        wait for 10 ns;
        wait;
    end process;

end Behavioral;
