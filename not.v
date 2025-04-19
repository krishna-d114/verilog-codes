//not gate
module notgate (
input wire a,
output wire y
);
    assign y=~a;
endmodule
module tb;
reg a;
wire y;
notgate uut(
    .a(a),
    .y(y)
);
initial begin
  $display("time\ta|y");
  $monitor("%g\t%b|%b",$time,a,y);
  //test
  a=0;#10;
  a=1;#10; 
$finish;
end
endmodule
