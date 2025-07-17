`timescale 1ns / 1ps
module FA_using_task(s,cout,a,b,cin);
input a,b,cin;
output reg s,cout;
always@(a or b or cin)
    begin
    FA(s,cout,a,b,cin); end
task FA;
    output reg sum,carry;
    input A,B,C;
    begin
        #2 sum=A^B^C;
            carry=(A&B) |(B&C)|(C&A);
    end
endtask
endmodule
