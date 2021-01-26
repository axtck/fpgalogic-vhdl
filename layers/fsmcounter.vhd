library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsmcounter is
	port(
		clk       : in  std_logic;
		rst       : in  std_logic;
		plus, min : in  std_logic;
		Z         : out std_logic       -- not sure if needed
	);
end entity fsmcounter;

architecture behavioral of fsmcounter is

	type state_type is (verhogen, constval, verlagen);
	signal ps, ns : state_type;

begin

	-- synchronous process
	sync_proc : process(clk, rst, ns) is
	begin
		if rst = '1' then
			ps <= constval;             -- check!!!!!!!!!!!!!!
		elsif rising_edge(clk) then
			ps <= ns;
		end if;
	end process sync_proc;

	-- combinatorial process
	comb_proc : process(ps, plus, min) is
	begin
		-- misschien iets doen met z
		Z <= '0';

		case ps is
			when constval =>
				if plus = '1' then
					ns <= verhogen;
				else
					ns <= verlagen;
				end if;
			when verhogen =>
				if plus = '1' then
					ns <= verhogen;
				else
					ns <= verlagen;
				end if;
			when verlagen =>
				if plus = '1' then
					ns <= constval;
				else
					ns <= verlagen;
				end if;
		end case;
	end process comb_proc;

end architecture behavioral;

