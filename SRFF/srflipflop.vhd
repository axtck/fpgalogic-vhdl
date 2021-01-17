library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity srflipflop is
	port(
		clk : in  std_logic;
		rst : in  std_logic;
		s   : in  std_logic;
		r   : in  std_logic;
		q   : out std_logic;
		qb  : out std_logic
	);
end entity srflipflop;

architecture behavioral of srflipflop is

begin

	-- SRFF logic process
	srff_proc : process(clk, rst) is
	begin
		if rst = '1' then
			q  <= '0';
			qb <= '0';
		elsif rising_edge(clk) then
			if s /= r then
				q  <= s;
				qb <= r;
			elsif s = '1' and r = '1' then
				q  <= 'Z';
				qb <= 'Z';
			end if;
		end if;
	end process srff_proc;

end architecture behavioral;

