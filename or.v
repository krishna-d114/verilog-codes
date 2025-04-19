// or gate
module or_gate(
    input wire a,
    input wire b,
    output wire y
);
    assign y=a|b;
endmodule
module test;
    reg a,b;
    wire y;

    or_gate uut(
        .a(a),
        .b(b),
        .y(y)
    );
initial begin
    $display("time\ta b |y");
    $monitor("%g\t%b %b |%b ",$time,a,b,y);
    //test combos
    a=0;b=0;#10;
    a=1;b=0;#10;
    a=0;b=1;#10;
    a=1;b=1;#10;
end
endmodule
