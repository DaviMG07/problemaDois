module matriz(
    input displayClock,
    input unidadeSegundos,
    input dezenaSegundos,
    input unidadeMinuto,
    input dezenaMinuto,
    input chaveSeletora,
    input [2:0] tipoRega,
    input [2:0] nivelDagua,
    output [4:0] colunas,
    output [6:0] linhas
);

wire [3:0] aux;
wire [2:0] info;

gerarMatrizRega(tipoRega, desenho);
gerarMatrizNivel(nivelDagua, desenho);

contadorCinco(displayClock, aux, );

decoderMatriz(colunas, linhas, info);

endmodule

