// name: RedeclareElementClass1
// keywords:
// status: correct
// cflags: -d=newInst
//

model A
  replaceable model B
    Real x = 1.0;
  end B;

  B b;
end A;

model RedeclareElementClass1
  extends A;

  redeclare model B
    Real x = 2.0;
  end B;
end RedeclareElementClass1;
