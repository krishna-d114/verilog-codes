module mux4 (
    input wire [1:0] sel,  // 2-bit selector input
    input wire a, b, c, d, // data inputs
    output reg y           // output is reg, because we assign in an always block
);

    always @(*) begin
        case(sel)
            2'b00: y = a;  // if sel is 00, output a
            2'b01: y = b;  // if sel is 01, output b
            2'b10: y = c;  // if sel is 10, output c
            2'b11: y = d;  // if sel is 11, output d
            default: y = 1'b0; // default case (just in case)
        endcase
    end

endmodule
module tb;
    reg [1:0] sel;  // 2-bit selector input
    reg a, b, c, d; // data inputs
    wire y;         // output wire

    // Instantiate the 4-to-1 multiplexer
    mux4 uut (
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    initial begin
        // Display headers for output
        $display("Time\t a b c d sel | y");
        // Monitor the values of a, b, c, d, sel, and y during simulation
        $monitor("%g\t %b %b %b %b %b | %b", $time, a, b, c, d, sel, y);

        // Test case 1: sel = 00, expect y = a
        sel = 2'b00; a = 1; b = 0; c = 0; d = 0; #10;
        // Test case 2: sel = 01, expect y = b
        sel = 2'b01; a = 0; b = 1; c = 0; d = 0; #10;
        // Test case 3: sel = 10, expect y = c
        sel = 2'b10; a = 0; b = 0; c = 1; d = 0; #10;
        // Test case 4: sel = 11, expect y = d
        sel = 2'b11; a = 0; b = 0; c = 0; d = 1; #10;

        // End the simulation
        $finish;
    end

endmodule
