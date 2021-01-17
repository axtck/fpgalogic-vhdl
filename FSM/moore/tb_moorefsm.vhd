library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_moorefsm is
end entity tb_moorefsm;

architecture behavioral of tb_moorefsm is

	-- moore FSM component
	component moorefsm
		port(
			clk    : in  std_logic;
			rst    : in  std_logic;
			clr    : in  std_logic;
			tog_en : in  std_logic;
			z1     : out std_logic
		);
	end component moorefsm;

	-- signals
	signal clk    : std_logic := '0';
	signal rst    : std_logic := '0';
	signal clr    : std_logic := '1';
	signal tog_en : std_logic := '0';
	signal z1     : std_logic;

begin

	-- instantiate from component
	moorefsm_inst : moorefsm
		port map(
			clk    => clk,
			rst    => rst,
			clr    => clr,
			tog_en => tog_en,
			z1     => z1
		);

	clk    <= not clk after 8 ns;
	clr    <= '0' after 50 ns;
	tog_en <= '1' after 100 ns, '0' after 200 ns;

end architecture behavioral;

