library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_srflipflop is
end entity tb_srflipflop;

architecture behavioral of tb_srflipflop is

	-- SRFF component
	component srflipflop
		port(
			clk : in  std_logic;
			rst : in  std_logic;
			s   : in  std_logic;
			r   : in  std_logic;
			q   : out std_logic;
			qb  : out std_logic
		);
	end component srflipflop;

	-- signals
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal s   : std_logic := '0';
	signal r   : std_logic := '0';
	signal q   : std_logic;
	signal qb  : std_logic;

	-- for 10 ns clock period
	constant clk_period : time := 10 ns;

begin

	-- instantiate from component
	srflipflop_inst : srflipflop
		port map(
			clk => clk,
			rst => rst,
			s   => s,
			r   => r,
			q   => q,
			qb  => qb
		);

	-- clock process
	clk_proc : process is
	begin
		clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
	end process clk_proc;

	-- process to change input values
	change_invals_proc : process is
	begin
		rst <= '1';
		wait for 50 ns;

		rst <= '0';
		s   <= '0';
		r   <= '1';
		wait for 50 ns;

		rst <= '0';
		s   <= '1';
		r   <= '0';
		wait for 50 ns;

		rst <= '0';
		s   <= '0';
		r   <= '0';
		wait for 50 ns;

		rst <= '0';
		s   <= '1';
		r   <= '1';
		wait;

	end process change_invals_proc;

end architecture behavioral;
