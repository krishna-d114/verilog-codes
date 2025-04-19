//xor gate 
module xor_gate(
    input wire a,
    input wire b,
    output wire y
);
assign y=(((a&(~b))|((~a)&b)));
endmodule
//testbench

module tb;
reg a,b;
wire y;
xor_gate uut(
    .a(a),
    .b(b),
    .y(y)
);
initial begin
    $display("Time\t a b |y");
    $monitor("%g\t %b %b |%b",$time,a,b,y);
    a=0;b=0;#10;
    a=1;b=0;#10;
    a=0;b=1;#10;
    a=1;b=1;#10;
    $finish;
end
endmodule

 
