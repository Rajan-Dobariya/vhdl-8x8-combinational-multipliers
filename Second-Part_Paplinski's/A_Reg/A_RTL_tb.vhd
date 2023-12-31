--Group2
	-- Shetty
	-- Dobariya
	-- Fan

library ieee;use ieee.std_logic_1164.all;
entity A_RTL_tb is
end entity;
 
architecture tb of A_RTL_tb is
 
component A_reg
	port(clk : in std_logic;
         op  : in std_logic_vector(6 downto 0);
	     F  : in std_logic_vector(7 downto 0); 
         A : out std_logic_vector(7 downto 0)
    );
end component;

signal clk_tb : std_logic := '0';
signal op_tb  : std_logic_vector(6 downto 0) := "0000000";
signal F_tb   : std_logic_vector(7 downto 0) := "00000000"; 
signal A_tb   : std_logic_vector(7 downto 0);
constant period : time := 3 ns;
begin
uut: A_reg      
	port map (clk => clk_tb,
			op => op_tb,
			F => F_tb,
		    A => A_tb
		  );
			clk_tb <= not clk_tb after period/2;
	  		op_tb <= "0000000", "1111111" after 10 ns, "1010111" after 20 ns, "1000100" after 30 ns, "1010101" after 40 ns, "0000011" after 50 ns;
			F_tb <= "00000000", "10100001" after 10 ns, "10110101" after 20 ns, "10110010" after 30 ns, "11111111" after 40 ns, "10101010" after 50 ns;
		
stop: process
begin
	wait for 60 ns; 
		assert false
			report "simulation ended by Dobariya at" & time'image(now)
		severity failure;
	end process;
end tb;

