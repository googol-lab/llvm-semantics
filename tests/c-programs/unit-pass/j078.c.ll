; ModuleID = './j078.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b.x = internal thread_local global i32 0, align 4
@d.x = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @a() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @b() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @c() #0 {
  %x = alloca i32, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @d() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @e() #0 {
  %x = alloca i32, align 4
  store i32 0, i32* %x, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %p = alloca i32*, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @g() #0 {
  %x = alloca i32, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @h() #0 {
  %x = alloca i32, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
