library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4_dataflow is
	port(
		d0, d1, d2, d3, s0, s1 : in  bit;
		y                      : out bit
	);
end entity mux4_dataflow;

architecture dataflow of mux4_dataflow is

begin
	
	-- mux logic
	y <= ((d0 and (not s0) and (not s1)) or (d1 and s1 and (not s0)) or (d2 and (not s1) and s0) or (d3 and s0 and s1));

end architecture dataflow;