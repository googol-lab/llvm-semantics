; ModuleID = '<stdin>'

@t3 = global i32* @t1
@t1 = global i32 4
@t4 = global i32** @t3
@t2 = global i32* @t1
@0 = global float* @2
@1 = global float* @2
@2 = global float 0.000000e+00
@3 = global float* @2
@fptr = global void ()* @f
@sptr1 = global [11 x i8]* @somestr
@somestr = constant [11 x i8] c"hello world"
@sptr2 = global [11 x i8]* @somestr

declare void @f()
