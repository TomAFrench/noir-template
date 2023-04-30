fn main(x : Field, y : pub Field) {
    constrain x != y;
}

#[test]
fn test_not_equal() {
    main(1, 2);

    // Failing test case
    // main(1, 1);
}
