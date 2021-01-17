library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logicgates is
	port(
		a, b : in  std_logic;
		c    : out std_logic_vector(0 to 6)
	);
end entity logicgates;

architecture behavioral of logicgates is

begin

	-- gate logic
	c(0) <= a and b;
	c(1) <= a or b;
	c(2) <= not a;
	c(3) <= a nand b;
	c(4) <= a nor b;
	c(5) <= a xor b;
	c(6) <= a xnor b;

end architecture behavioral;
