// 2-to-1 Multiplexer Design
module mux2to1(
    input wire i0,   // Input 0
    input wire i1,   // Input 1
    input wire s,    // Select signal
    output wire y    // Output
);
    assign y = s ? i1 : i0;  // If s = 1, y = i1, else y = i0
endmodule

// Testbench for 2-to-1 Multiplexer
module tb_mux2to1;
    reg i0, i1, s;   // Declare reg variables for inputs and select signal
    wire y;          // Declare wire for output

    // Instantiate the 2-to-1 mux
    mux2to1 uut (
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y)
    );

    initial begin
        $display("Time\ti0 i1 s | y");
        $monitor("%g\t%b %b %b | %b", $time, i0, i1, s, y);  // Display format

        // Test cases
        s = 0; i0 = 0; i1 = 1; #10;  // s=0 => y = i0
        s = 0; i0 = 1; i1 = 0; #10;  // s=0 => y = i0
        s = 1; i0 = 1; i1 = 0; #10;  // s=1 => y = i1
        s = 1; i0 = 0; i1 = 1; #10;  // s=1 => y = i1

        $finish;  // End simulation
    end
endmodule
