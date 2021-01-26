library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signedcounter is
	port(
		clk                          : in  std_logic;
		rst                          : in  std_logic;
		verhogen, constval, verlagen : in  std_logic;
		qCount                       : out std_logic_vector(7 downto 0)
	);
end entity signedcounter;

architecture behavioral of signedcounter is

	signal count : signed(7 downto 0);

begin

	-- count process
	count_proc : process(clk, rst, count) is
	begin
		if rst = '1' then
			count <= (others => '0');
		elsif rising_edge(clk) then
			if verhogen = '1' then
				count <= count + 1;
			end if;
			if constval = '1' then
				count <= count;
			end if;
			if verlagen = '1' then
				count <= count - 1;
			end if;
		end if;
	end process count_proc;
	
	-- set q
	qCount <= std_logic_vector(count);

end architecture behavioral;

