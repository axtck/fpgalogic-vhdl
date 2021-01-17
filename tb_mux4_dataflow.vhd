library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mux4_dataflow is
end entity tb_mux4_dataflow;

architecture dataflow of tb_mux4_dataflow is

	-- create mux4 component
	component mux4_dataflow
		port(
			d0, d1, d2, d3, s0, s1 : in  bit;
			y                      : out bit
		);
	end component mux4_dataflow;

	-- auto declared signals after instantiating
	signal d0 : bit := '1';
	signal d1 : bit := '0';
	signal d2 : bit := '1';
	signal d3 : bit := '0';
	signal s0 : bit := '0';
	signal s1 : bit := '0';
	signal y  : bit;
	
begin

	-- instantiate from component
	mux4_dataflow_inst : mux4_dataflow
		port map(
			d0 => d0,
			d1 => d1,
			d2 => d2,
			d3 => d3,
			s0 => s0,
			s1 => s1,
			y  => y
		);

	-- process to change input values
	change_invals_proc : process is
	begin
		s0 <= '0';
		s1 <= '0';
		wait for 50 ns;

		s0 <= '0';
		s1 <= '1';
		wait for 50 ns;

		s0 <= '1';
		s1 <= '0';
		wait for 50 ns;

		s0 <= '1';
		s1 <= '1';

		wait;
	end process change_invals_proc;

end architecture dataflow;
