library ieee;
use ieee.std_logic_1164.all;
entity mss is
	port(clock,reset,encender,start,remojar,C_1,C_2,C_3,C_4,C_5,C_6,C_7,C_8,C_9: in std_logic;
	seleccion: in std_logic_vector(3 downto 0);
	remojo,bomba,centri,valvula1,valvula2,listo: out std_logic;
	enable:out std_logic_vector(9 downto 0));
end mss;
architecture solution of mss is
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Tp,Tr,a,b,c,d);
signal y:estado;
signal formato_entradas: std_logic_vector(15 downto 0);
signal formato_salidas: std_logic_vector(15 downto 0);
begin
	formato_entradas<=encender&seleccion&remojar&start&C_1&C_2&C_3&C_4&C_5&C_6&C_7&C_8&C_9;
	remojo<=formato_salidas(15);enable(9)<=formato_salidas(14);enable(8)<=formato_salidas(13);enable(7)<=formato_salidas(12);enable(6)<=formato_salidas(11);
	enable(5)<=formato_salidas(10);enable(4)<=formato_salidas(9);enable(3)<=formato_salidas(8);enable(2)<=formato_salidas(7);
	enable(1)<=formato_salidas(6);enable(0)<=formato_salidas(5);bomba<=formato_salidas(4);centri<=formato_salidas(3);
	valvula1<=formato_salidas(2);valvula2<=formato_salidas(1);listo<=formato_salidas(0);
	process(clock,reset)
	begin 
		if reset='0' then y<=Ta;
		elsif(clock'event and clock='1')then
				case y is
					when Ta=> if formato_entradas="1000000000000000" then y<=Tb; else y<=Ta; end if;
					when Tb=> if formato_entradas="0000000000000000" then y<=Tc; else y<=Tb; end if;
					when Tc=> if formato_entradas="0100000000000000" then y<=Td; 
								 elsif formato_entradas="0010000000000000" then y<=Td;	
								 elsif formato_entradas="0001000000000000" then y<=Td;
								 elsif formato_entradas="0000100000000000" then y<=Td;
									else y<=Tc; end if;
					when Td=> if formato_entradas="0000000000000000" then y<=a; else y<=Te; end if;
					when Te=> if formato_entradas="0000000000000000" then y<=Tf; else y<=Te; end if;
				   when Tf=> if formato_entradas="0000001000000000" then y<=Tg; else y<=Tf; end if;
		         when Tg=> if formato_entradas="0000000000000000" then y<=Th; else y<=Tg; end if;			
					when Th=> if formato_entradas="0000000100000000" then y<=Ti; else y<=Th; end if;
					when Ti=> if formato_entradas="0000000010000000" then y<=Tj; else y<=Ti; end if;
					when Tj=> if formato_entradas="0000000001000000" then y<=Tk; else y<=Tj; end if;
					when Tk=> if formato_entradas="0000000000100000" then y<=Tl; else y<=Tk; end if;
					when Tl=> if formato_entradas="0000000000010000" then y<=Tm; else y<=Tl; end if;
					when Tm=> if formato_entradas="0000000000001000" then y<=Tn; else y<=Tm; end if;
					when Tn=> if formato_entradas="0000000000000100" then y<=Tp; else y<=Tn; end if;
					when Tp=> if formato_entradas="0000000000000010" then y<=Tr; else y<=Tp; end if;
					when Tr=> if formato_entradas="0000000000000001" then y<=Tc; else y<=Tr; end if;
					when a=> if formato_entradas="0000001000000000" then y<=b; else y<=a; end if;
		         when b=> if formato_entradas="0000000000000000" then y<=c; else y<=b; end if;
					when c=> if formato_entradas="0000000100000000" then y<=d; else y<=c; end if;
					when d=> if formato_entradas="0000000001000000" then y<=Tk; else y<=d; end if;
				end case;
				end if;
				end process;
	process(y)
	begin
		formato_salidas<="0000000000000000";
		case y is
			when Ta=>
			when Tb=> 
			when Tc=> 
			when Td=> 
			when Te=> 
			when Tf=> formato_salidas<="0000000000100000";
			when Tg=> formato_salidas<="0000000001000100";
			when Th=> formato_salidas<="1000000010000000";
			when Ti=> formato_salidas<="0000000100000000";
			when Tj=> formato_salidas<="0000001000011000";
			when Tk=> formato_salidas<="0000010000000000";
			when Tl=> formato_salidas<="0000100000011000";
			when Tm=> formato_salidas<="0001000000000000";
			when Tn=> formato_salidas<="0010000000000010";
			when Tp=> formato_salidas<="0100000000011000";
			when Tr=> formato_salidas<="0000000000000001";
			when a=>
			when b=>
			when c=> formato_salidas<="0000000001000100";
			when d=> formato_salidas<="0000000010000000";
		end case;
	end process;
end solution;
