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
decrementadorSeis(dezMinutos, presetDezMinutos, reset, dezenaMinuto, meiaHora);

//conta 30 min
flipFlopT(!umMinuto, 1, fooReset, nivelDaguaAux[0]);
flipFlopT(!nivelDaguaAux[0], 1, fooReset, nivelDaguaAux[1]);
flipFlopT(!nivelDaguaAux[1], 1, fooReset, nivelDaguaAux[2]);
flipFlopT(!nivelDaguaAux[2], 1, fooReset, nivelDaguaAux[3]);
flipFlopT(!nivelDaguaAux[3], 1, fooReset, nivelDaguaAux[4]);
and(fooReset, nivelDaguaAux[0], !nivelDaguaAux[1], nivelDaguaAux[2], nivelDaguaAux[3], nivelDaguaAux[4]);

//conta 12 min
and(dozeMin, nivelDaguaAux[0], nivelDaguaAux[1], !nivelDaguaAux[2], nivelDaguaAux[3], !nivelDaguaAux[4]);

//conta 6 min
and(seisMin, !nivelDaguaAux[0], nivelDaguaAux[1], nivelDaguaAux[2], !nivelDaguaAux[3], !nivelDaguaAux[4]);

decodificadorDisplay(umSegundo, displayClock, unidadeSegundos, dezenaSegundos, unidadeMinuto, dezenaMinuto, displayDigits, displaySegments);

endmodule
