pragma circom 2.0.5;
include "div.circom";
include "exp.circom";

// in[0] >> in[1]
// in[1] >> in[0]

// in[3] value, (low, high): shift

template SHR_R () {
  signal input in[2];
  signal output out;

  assert(in[0] - 8 > 0);

  // out == in / 2**n
  component exp = Exp();
  exp.in[0] <== 2;
  exp.in[1] <== in[0] - 8;

  component div = Div();
  div.in[0] <== in[1];
  div.in[1] <== exp.out;

  out <== div.out;
}