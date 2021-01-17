library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_dflipflop is
end entity tb_dflipflop;

architecture behavioral of tb_dflipflop is

	-- DFF component
	component dflipflop
		port(
			clk  : in  std_logic;
			rst  : in  std_logic;
			din  : in  std_logic;
			dout : out std_logic
		);
	end component dflipflop;

	-- signals
	signal clk  : std_logic := '0';
	signal rst  : std_logic := '1';
	signal din  : std_logic := '0';
	signal dout : std_logic;

	-- for 10 ns clock period
	constant clk_period : time := 10 ns;

begin

	-- instantiate from component
	dflipflop_inst : dflipflop
		port map(
			clk  => clk,
			rst  => rst,
			din  => din,
			dout => dout
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
		din <= '0';
		wait for 50 ns;

		rst <= '0';
		din <= '1';
		wait;

	end process change_invals_proc;

end architecture behavioral;
