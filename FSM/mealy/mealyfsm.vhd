library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mealyfsm is
	port(
		clk : in  std_logic;
		rst : in  std_logic;
		set : in  std_logic;
		x   : in  std_logic;
		z2  : out std_logic
	);
end entity mealyfsm;

architecture behavioral of mealyfsm is

	type state_type is (ST_00, ST_10, ST_11);
	signal ps : state_type := ST_11;
	signal ns : state_type;

begin

	-- synchronous FSM process
	sync_proc : process(clk, rst) is
	begin
		if rst = '1' then
			z2 <= '0';
		elsif rising_edge(clk) then
			if set = '1' then
				ps <= ST_11;
			else
				ps <= ns;
			end if;
		end if;
	end process sync_proc;

	-- combinatorial FSM process
	comb_proc : process(x, ps) is
	begin
		z2 <= '0';
		ns <= ps;
		case ps is
			when ST_00 =>
				if x = '1' then
					ns <= ST_10;
				end if;
			when ST_10 =>
				if x = '0' then
					ns <= ST_00;
				else
					ns <= ST_11;
				end if;
			when ST_11 =>
				if x = '0' then
					ns <= ST_00;
				else
					z2 <= '1';
				end if;
		end case;
	end process comb_proc;

end architecture behavioral;

