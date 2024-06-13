module flipFlopT(
    input clock,
    input toggle,
    input preset,
    input reset,
    output reg outQ
);

always @(posedge clock or posedge preset or posedge reset) begin
    if (reset) begin
        outQ <= 0;
    end
    else if (preset) begin
        outQ <= 1;
    end
    else if (toggle) begin
        outQ <= ~outQ;
    end
end

endmodule