library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dflipflop is
	port(
		clk  : in  std_logic;
		rst  : in  std_logic;
		din  : in  std_logic;
		dout : out std_logic
	);
end entity dflipflop;

architecture behavioral of dflipflop is

begin
	
	-- DFF logic process
	dff_proc : process(clk, rst, din) is
	begin
		if rst = '1' then
			dout <= '0';
		elsif rising_edge(clk) then
			dout <= din;
		end if;
	end process dff_proc;

end architecture behavioral;

