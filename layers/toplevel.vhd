library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity toplevel is
	port(
		clk                : in  std_logic;
		rst                : in  std_logic;
		hoger, cnst, lager : in  std_logic;
		pls, mn            : in  std_logic;
		qC                 : out std_logic_vector(7 downto 0)
	);
end entity toplevel;

architecture behavioral of toplevel is

	-- counter component
	component signedcounter
		port(
			clk                          : in  std_logic;
			rst                          : in  std_logic;
			verhogen, constval, verlagen : in  std_logic;
			qCount                       : out std_logic_vector(7 downto 0)
		);
	end component signedcounter;

	-- fsm component
	component fsmcounter
		port(
			clk       : in  std_logic;
			rst       : in  std_logic;
			plus, min : in  std_logic;
			Z         : out std_logic
		);
	end component fsmcounter;

	-- counter signals
	signal verhogen : std_logic;
	signal constval : std_logic;
	signal verlagen : std_logic;
	signal qCount   : std_logic_vector(7 downto 0);

	-- fsm signals
	signal plus : std_logic;
	signal min  : std_logic;
	signal Z    : std_logic;

begin

	signedcounter_inst : signedcounter
		port map(
			clk      => clk,
			rst      => rst,
			verhogen => verhogen,
			constval => constval,
			verlagen => verlagen,
			qCount   => qCount
		);

	fsmcounter_inst : fsmcounter
		port map(
			clk  => clk,
			rst  => rst,
			plus => plus,
			min  => min,
			Z    => Z
		);

	verhogen <= hoger;
	verlagen <= lager;
	constval <= cnst;
	qC       <= qCount;

end architecture behavioral;

