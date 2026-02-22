//Full Adder using Structural Modeling or Gate level modeling
//------------------------
// 		  Design
//------------------------

module full_adder_structural (
  input a, b, cin,
  output sum, cout);
  
  wire x1, c1, c2;		//Internal connection 

  //Structural modeling of fulladder
  xor (x1, a, b);
  xor (sum, x1, cin);

  and (c1, a, b);
  and (c2, x1, cin);

  or  (cout, c1, c2);

endmodule

//-------------------------
//		TESTBENCH
//-------------------------

module full_adder_tb;
  reg a, b, cin;
  wire sum, cout;

  full_adder_structural dut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

  initial begin
    $display("-------------------");
    $display("a b cin | sum cout");
    $display("-------------------");

    a=0; b=0; cin=0; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);

    a=0; b=0; cin=1; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);

    a=0; b=1; cin=0; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);

    a=0; b=1; cin=1; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);

    a=1; b=0; cin=0; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);

    a=1; b=0; cin=1; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);

    a=1; b=1; cin=0; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);

    a=1; b=1; cin=1; #10;
    $display("%b %b  %b  |  %b    %b", a,b,cin,sum,cout);
    $display("-------------------");

    $finish;
  end

endmodule
