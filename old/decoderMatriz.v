module decoderMatriz(
    input displayClock,
    input [4:0] linha0,
    input [4:0] linha1,
    input [4:0] linha2,
    input [4:0] linha3,
    input [4:0] linha4,
    input [4:0] linha5,
    input [4:0] linha6,
    output [4:0] colunas,
    output [6:0] linhas
);

wire [2:0] contagem;

contadorSete(displayClock, contagem, seteClock);

demuxUmPCinco(1, contagem, colunas);

mux_35_3_7(linha0, linha1, linha2, linha3, linha4, linha5, linha6, contagem, linhas);

mux_5_3_1(linha0, contagem, linhas[0]);
