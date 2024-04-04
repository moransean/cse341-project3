module fulladder(a,b,c,s,cout) ;
wire w1, w2, w3, w4, s, cout;
reg a, b, c;
xor
    g1(w1, a, b),
    g2(s, w1, c);
and
    g3(w2, c, b),
    g4(w3, c, a),
    g5(w4, a, b);
or
    g6(cout, w2, w3, w4);
endmodule

module fourBitAdder(x,y,s,cout,cin);
    input [3:0] x,y;
    output [3:0] s;
    input cin;
    output cout;
    wire c[2:0];
    fulladder f0 (x[0],y[0],cin,s[0],c[0]);
    fulladder f1 (x[1],y[1],c[0],s[1],c[1]);
    fulladder f2 (x[2],y[2],c[1],s[2],c[2]);
    fulladder f3 (x[3],y[3],c[2],s[3],cout);
endmodule

module twoToOneMultiplexor(i0,i1,s,y);
wire w1, w2, w3;
input i0, i1, s;
output y;
not g1(w1, s);
and
    g2(w2, w1, i0);
    g3(w3, i1, s);
or (y, w2, w3);
endmodule

module sixteenBitAdder(x,y,sub,s,cout,cin);
    input [15:0] x,b;
    input sub;
    output [15:0] s;
    output v;
    wire cout;
    wire [15:0] y;
    wire [14:0] c;
    wire [15:0] notB;
    not
        g0(notB[0], b[0]);
        g1(notB[1], b[1]);
        g2(notB[2], b[2]);
        g3(notB[3], b[3]);
        g4(notB[4], b[4]);
        g5(notB[5], b[5]);
        g6(notB[6], b[6]);
        g7(notB[7], b[7]);
        g8(notB[8], b[8]);
        g9(notB[9], b[9]);
        g10(notB[10], b[10]);
        g11(notB[11], b[11]);
        g12(notB[12], b[12]);
        g13(notB[13], b[13]);
        g14(notB[14], b[14]);
        g15(notB[15], b[15]);
    twoToOneMultiplexor m0 (b[0],notB[0],sub,y[0]);
    twoToOneMultiplexor m1 (b[1],notB[1],sub,y[1]);
    twoToOneMultiplexor m2 (b[2],notB[2],sub,y[2]);
    twoToOneMultiplexor m3 (b[3],notB[3],sub,y[3]);
    twoToOneMultiplexor m4 (b[4],notB[4],sub,y[4]);
    twoToOneMultiplexor m5 (b[5],notB[5],sub,y[5]);
    twoToOneMultiplexor m6 (b[6],notB[6],sub,y[6]);
    twoToOneMultiplexor m7 (b[7],notB[7],sub,y[7]);
    twoToOneMultiplexor m8 (b[8],notB[8],sub,y[8]);
    twoToOneMultiplexor m9 (b[9],notB[9],sub,y[9]);
    twoToOneMultiplexor m10 (b[10],notB[10],sub,y[10]);
    twoToOneMultiplexor m11 (b[11],notB[11],sub,y[11]);
    twoToOneMultiplexor m12 (b[12],notB[12],sub,y[12]);
    twoToOneMultiplexor m13 (b[13],notB[13],sub,y[13]);
    twoToOneMultiplexor m14 (b[14],notB[14],sub,y[14]);
    twoToOneMultiplexor m15 (b[15],notB[15],sub,y[15]);
    fulladder f0 (x[0],y[0],sub,s[0],c[0]);
    fulladder f1 (x[1],y[1],c[0],s[1],c[1]);
    fulladder f2 (x[2],y[2],c[1],s[2],c[2]);
    fulladder f3 (x[3],y[3],c[2],s[3],c[3]);
    fulladder f4 (x[4],y[4],c[3],s[4],c[4]);
    fulladder f5 (x[5],y[5],c[4],s[5],c[5]);
    fulladder f6 (x[6],y[6],c[5],s[6],c[6]);
    fulladder f7 (x[7],y[7],c[6],s[7],c[7]);
    fulladder f8 (x[8],y[8],c[7],s[8],c[8]);
    fulladder f9 (x[9],y[9],c[8],s[9],c[9]);
    fulladder f10 (x[10],y[10],c[9],s[10],c[10]);
    fulladder f11 (x[11],y[11],c[10],s[11],c[11]);
    fulladder f12 (x[12],y[12],c[11],s[12],c[12]);
    fulladder f13 (x[13],y[13],c[12],s[13],c[13]);
    fulladder f14 (x[14],y[14],c[13],s[14],c[14]);
    fulladder f15 (x[15],y[15],c[14],s[15],cout);
    xor g16(v, cout, c[14]);
endmodule