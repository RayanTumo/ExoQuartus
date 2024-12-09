LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Signaux IS
PORT (
    nb : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- Entrée : le nombre binaire
    a : OUT STD_LOGIC;
    b : OUT STD_LOGIC;
    c : OUT STD_LOGIC;
    d : OUT STD_LOGIC;
    e : OUT STD_LOGIC;
    f : OUT STD_LOGIC;
    g : OUT STD_LOGIC
);
END Signaux;

ARCHITECTURE archi OF Signaux IS
SIGNAL AfficheCompteur: STD_LOGIC_VECTOR(6 DOWNTO 0); -- Signal interne pour les segments (g, f, e, d, c, b, a)
BEGIN

-- Mapping des segments pour chaque chiffre
WITH nb SELECT
AfficheCompteur <=
    "1000000" WHEN "0000", --0
    "1111001" WHEN "0001", -- 1
    "0100100" WHEN "0010", -- 2
    "0110000" WHEN "0011", -- 3
    "0011001" WHEN "0100", -- 4
    "0010010" WHEN "0101", -- 5
    "0000010" WHEN "0110", -- 6
    "1111000" WHEN "0111", -- 7
    "0000000" WHEN "1000", -- 8
    "0010000" WHEN "1001", -- 9
    "0000110" WHEN OTHERS; -- E pour les autres valeurs

-- Assignation des segments à chaque sortie
a <= AfficheCompteur(0);
b <= AfficheCompteur(1);
c <= AfficheCompteur(2);
d <= AfficheCompteur(3);
e <= AfficheCompteur(4);
f <= AfficheCompteur(5);
g <= AfficheCompteur(6);

END archi;
