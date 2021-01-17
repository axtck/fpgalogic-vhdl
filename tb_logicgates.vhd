library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_logicgates is
end entity tb_logicgates;

architecture behavioral of tb_logicgates is

	-- create logicgates component
	component logicgates
		port(
			a, b : in  std_logic;
			c    : out std_logic_vector(0 to 6)
		);
	end component logicgates;

	-- auto declared signals after instantiating
	signal a : std_logic := '0';
	signal b : std_logic := '0';
	signal c : std_logic_vector(0 to 6);

begin

	-- instantiate from component
	logicgates_inst : logicgates
		port map(
			a => a,
			b => b,
			c => c
		);

	-- process to change input values
	change_invals_proc : process is
	begin
		a <= '0';
		b <= '0';

		wait for 50 ns;
		a <= '0';
		b <= '1';

		wait for 50 ns;
		a <= '1';
		b <= '0';

		wait for 50 ns;
		a <= '1';
		b <= '1';

		wait;
	end process change_invals_proc;

end architecture behavioral;