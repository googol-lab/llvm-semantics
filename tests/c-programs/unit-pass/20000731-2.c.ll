; ModuleID = './20000731-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %i, align 4
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp ne i32 %3, 1024
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %j, align 4
  %7 = icmp sle i32 %6, 0
  br label %8

; <label>:8                                       ; preds = %5, %2
  %9 = phi i1 [ true, %2 ], [ %7, %5 ]
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %8
  %11 = load i32, i32* %i, align 4
  %12 = mul nsw i32 %11, 2
  store i32 %12, i32* %i, align 4
  %13 = load i32, i32* %j, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %j, align 4
  br label %2

; <label>:15                                      ; preds = %8
  %16 = load i32, i32* %j, align 4
  %17 = icmp ne i32 %16, 10
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %21 = load i32, i32* %1
  ret i32 %21
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
