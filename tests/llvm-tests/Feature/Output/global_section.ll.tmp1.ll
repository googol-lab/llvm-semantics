; ModuleID = '<stdin>'

@X = global i32 4, section "foo", align 16

define void @test() section "bar" {
  ret void
}
