library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mealyfsm is
end entity tb_mealyfsm;

architecture behavioral of tb_mealyfsm is

	-- mealy FSM component
	component mealyfsm
		port(
			clk : in  std_logic;
			rst : in  std_logic;
			set : in  std_logic;
			x   : in  std_logic;
			z2  : out std_logic
		);
	end component mealyfsm;

	-- signals
	signal clk : std_logic;
	signal rst : std_logic;
	signal set : std_logic;
	signal x   : std_logic;
	signal z2  : std_logic;

begin

	-- instantiate from component
	mealyfsm_inst : mealyfsm
		port map(
			clk => clk,
			rst => rst,
			set => set,
			x   => x,
			z2  => z2
		);

	clk <= not clk after 8 ns;
	set <= '0' after 40 ns;

	-- simulation process
	change_invals_proc : process is
	begin
		wait for 100 ns;
		wait until rising_edge(clk);
		x <= '1';
		wait until rising_edge(clk);
		x <= '0';
		wait until rising_edge(clk);
		x <= '1';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		x <= '0';
		wait until rising_edge(clk);
		x <= '1';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		x <= '0';
		wait;

	end process change_invals_proc;

end architecture behavioral;

