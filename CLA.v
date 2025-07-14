`timescale 1ns / 1ps
module CLA (
    input [3:0] A,B, 
    input Cin, 
    output [3:0]Sum,  
    output Cout
);
    wire [3:0] G,P; 
    wire [3:0] C;
    assign G=A&B;        
    assign P=A^B;
    assign C[0]=Cin;
    assign C[1]=G[0] | (P[0]&C[0]);
    assign C[2]=G[1] | (P[1]&G[0]) | (P[1]&P[0]&C[0]);
    assign C[3]=G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | 
                         (P[2]&P[1] &P[0]&C[0]);
    assign Cout = G[3] | (P[3]&C[3]);
    assign Sum = P^C;

endmodule
