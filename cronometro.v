module cronometro(
    input displayClock,
    input umSegundo,
    input aspersao,
    input gotejamento,
    output [3:0] dezenaMinuto,
    output [3:0] unidadeMinuto,
    output [3:0] dezenaSegundos,
    output [3:0] unidadeSegundos,
    output [3:0] displayDigits,
    output [7:0] displaySegments,
    output [2:0] nivelDagua
);

wire [3:0] presetUniSegundos, presetDezSegundos, presetUniMinutos, presetDezMinutos;

assign presetUniSegundos[0] <= 0;
assign presetUniSegundos[1] <= 0;
assign presetUniSegundos[2] <= 0;
assign presetUniSegundos[3] <= 0;

assign presetDezSegundos[0] <= 0;
assign presetDezSegundos[1] <= 0;
assign presetDezSegundos[2] <= 0;
assign presetDezSegundos[3] <= 0;

or(presetUniMinutos[0], aspersao, gotejamento);
and(presetUniMinutos[1], gotejamento, !aspersao);
and(presetUniMinutos[2], aspersao, !aspersao);
and(presetUniMinutos[3], aspersao, !aspersao);

and(presetDezMinutos[0], aspersao, !gotejamento);
and(presetDezMinutos[1], aspersao, !aspersao);
and(presetDezMinutos[2], aspersao, !gotejamento);
and(presetDezMinutos[3], aspersao, !aspersao);

and(reset, !gotejamento, !aspersao);

decrementadorDez(umSegundo, presetUniSegundos, reset, unidadeSegundos, dezSegundos);
decrementadorSeis(dezSegundos, presetDezSegundos, reset, dezenaSegundos, umMinuto);
decrementadorDez(umMinuto, presetUniMinutos, reset, unidadeMinuto, dezMinutos);
decrementadorTres(dezMinutos, presetDezMinutos, reset, dezenaMinuto, meiaHora);



decodificadorDisplay(umSegundo, displayClock, unidadeSegundos, dezenaSegundos, unidadeMinuto, dezenaMinuto, displayDigits, displaySegments);

endmodule
