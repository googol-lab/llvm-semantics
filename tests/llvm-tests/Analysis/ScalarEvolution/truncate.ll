; RUN: opt < %s -analyze -scalar-evolution
; RUN: opt < %s -passes='print<scalar-evolution>'
; Regression test for assert ScalarEvolution::getTruncateExpr.

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128-ni:1"
target triple = "x86_64-unknown-linux-gnu"

define void @snork(i8* %arg, i8 %arg1, i64 %arg2) {
bb:
  br label %bb12

bb3:                                              ; preds = %bb34
  br i1 true, label %bb4, label %bb12

bb4:                                              ; preds = %bb3
  br label %bb6

bb5:                                              ; preds = %bb6
  ret void

bb6:                                              ; preds = %bb6, %bb4
  %tmp = phi i64 [ %tmp28, %bb4 ], [ %tmp10, %bb6 ]
  %tmp7 = phi i32 [ 3, %bb4 ], [ %tmp11, %bb6 ]
  %tmp8 = trunc i64 %tmp to i32
  %tmp9 = sdiv i32 %tmp8, %tmp7
  %tmp10 = add i64 %tmp, -1
  %tmp11 = add i32 %tmp9, %tmp7
  br i1 true, label %bb5, label %bb6

bb12:                                             ; preds = %bb3, %bb
  br label %bb13

bb13:                                             ; preds = %bb34, %bb12
  %tmp14 = phi i64 [ %arg2, %bb12 ], [ %tmp28, %bb34 ]
  %tmp15 = phi i8 [ %arg1, %bb12 ], [ %tmp26, %bb34 ]
  %tmp16 = phi i32 [ 1, %bb12 ], [ %tmp35, %bb34 ]
  %tmp17 = add i8 %tmp15, -1
  %tmp18 = sext i8 %tmp17 to i64
  %tmp19 = sub i64 1, %tmp14
  %tmp20 = add i64 %tmp19, %tmp18
  %tmp21 = trunc i64 %tmp20 to i32
  %tmp22 = icmp eq i32 %tmp21, 0
  br i1 %tmp22, label %bb32, label %bb23

bb23:                                             ; preds = %bb13
  br i1 true, label %bb25, label %bb24

bb24:                                             ; preds = %bb23
  br label %bb25

bb25:                                             ; preds = %bb24, %bb23
  %tmp26 = add i8 %tmp15, -2
  %tmp27 = sext i8 %tmp26 to i64
  %tmp28 = sub i64 %tmp27, %tmp20
  %tmp29 = trunc i64 %tmp28 to i32
  %tmp30 = icmp eq i32 %tmp29, 0
  br i1 %tmp30, label %bb31, label %bb34

bb31:                                             ; preds = %bb25
  br label %bb33

bb32:                                             ; preds = %bb13
  br label %bb33

bb33:                                             ; preds = %bb32, %bb31
  unreachable

bb34:                                             ; preds = %bb25
  %tmp35 = add nuw nsw i32 %tmp16, 2
  %tmp36 = icmp ugt i32 %tmp16, 52
  br i1 %tmp36, label %bb3, label %bb13
}
