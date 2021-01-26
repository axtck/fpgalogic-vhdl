library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_toplevel is
end entity tb_toplevel;

architecture behavioral of tb_toplevel is

	-- toplevel component
	component toplevel
		port(
			clk                : in  std_logic;
			rst                : in  std_logic;
			hoger, cnst, lager : in  std_logic;
			pls, mn            : in  std_logic;
			qC                 : out std_logic_vector(7 downto 0)
		);
	end component toplevel;

	-- toplevel signals
	signal clk   : std_logic := '0';
	signal rst   : std_logic := '0';
	signal hoger : std_logic := '0';
	signal cnst  : std_logic := '0';
	signal lager : std_logic := '0';
	signal pls   : std_logic := '0';
	signal mn    : std_logic := '0';
	signal qC    : std_logic_vector(7 downto 0);

	-- for 10 ns clock period
	constant clk_period : time := 10 ns;

begin

	toplevel_inst : toplevel
		port map(
			clk   => clk,
			rst   => rst,
			hoger => hoger,
			cnst  => cnst,
			lager => lager,
			pls   => pls,
			mn    => mn,
			qC    => qC
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

		rst   <= '0';
		cnst  <= '0';
		hoger <= '1';
		lager <= '0';
		wait for 20 ns;

		rst   <= '0';
		cnst  <= '0';
		hoger <= '1';
		lager <= '0';
		wait for 20 ns;

		rst   <= '0';
		cnst  <= '1';
		hoger <= '0';
		lager <= '0';
		wait for 20 ns;

		rst   <= '0';
		cnst  <= '0';
		hoger <= '0';
		lager <= '1';
		wait for 20 ns;

		rst   <= '0';
		cnst  <= '0';
		hoger <= '1';
		lager <= '0';
		wait for 20 ns;

		rst   <= '0';
		cnst  <= '1';
		hoger <= '0';
		lager <= '0';
		wait for 20 ns;

		rst   <= '0';
		cnst  <= '1';
		hoger <= '0';
		lager <= '0';
		wait for 20 ns;

		rst   <= '0';
		cnst  <= '1';
		hoger <= '0';
		lager <= '0';
		wait for 20 ns;

		wait;

	end process change_invals_proc;

end architecture behavioral;

