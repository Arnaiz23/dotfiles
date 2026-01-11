uitest() {
  file=$1

  bunx vitest --coverage --ui $1
}
