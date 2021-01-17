library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity moorefsm is
	port(
		clk    : in  std_logic;
		rst    : in  std_logic;
		clr    : in  std_logic;
		tog_en : in  std_logic;
		z1     : out std_logic
	);
end entity moorefsm;

architecture behavioral of moorefsm is

	type state_type is (ST0, ST1);
	signal ps : state_type := ST0;
	signal ns : state_type;

begin

	-- synchronous FSM process
	sync_proc : process(clk, rst) is
	begin
		if rst = '1' then
			z1 <= '0';
		elsif rising_edge(clk) then
			if clr = '1' then
				ps <= ST0;
			else
				ps <= ns;
			end if;
		end if;
	end process sync_proc;

	-- combinatorial FSM process
	comb_proc : process(ps, tog_en) is
	begin
		z1 <= '0';
		ns <= ps;
		case ps is
			when ST0 =>
				z1 <= '0';
				if tog_en = '1' then
					ns <= ST1;
				end if;
			when ST1 =>
				z1 <= '1';
				if tog_en = '1' then
					ns <= ST0;
				end if;
		end case;
	end process comb_proc;

end architecture behavioral;

