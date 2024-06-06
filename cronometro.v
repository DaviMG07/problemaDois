module cronometro(
    input displayClock,
    input umSegundo,
    output [4:0] dezenaMinuto,
    output [4:0] unidadeMinuto,
    output [4:0] dezenaSegundos,
    output [4:0] unidadeSegundos,
    output [4:0] displayDigits,
    output [7:0] displaySegments
);

wire [4:0] character;
wire decimoSegundo, umMinuto, decimoMinuto, umaHora;
wire [4:0] aux, helper, boo, woo, too;

decresceDez(umSegundo, unidadeSegundos, decimoSegundo);
//contadorSeis(decimoSegundo, dezenaSegundos, umMinuto);
//contadorDez(umMinuto, unidadeMinuto, decimoMinuto);
//contadorSeis(decimoMinuto, dezenaMinuto, umaHora);


flipFlopT(!displayClock, 1, 0, aux[0]);
flipFlopT(!aux[0], 1, 0, aux[1]);


nand(displayDigits[0], aux[0], aux[1]);
nand(displayDigits[1], !aux[0], aux[1]);
nand(displayDigits[2], aux[0], !aux[1]);
nand(displayDigits[3], !aux[0], !aux[1]);

vintePCinco(unidadeSegundos, dezenaSegundos, unidadeMinuto, dezenaMinuto, aux[0], aux[1], character);

//Falta terminar

decodificadorDisplay(umSegundo, character, displaySegments);

endmodule
