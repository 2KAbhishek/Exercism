/// Create an empty vector
pub fn create_empty() -> Vec<u8> {
    vec![]
}

/// Create a buffer of `count` zeroes.
///
/// Applications often use buffers when serializing data to send over the network.
pub fn create_buffer(count: usize) -> Vec<u8> {
    vec![0; count]
}

/// Create a vector containing the first five elements of the Fibonacci sequence.
///
/// Fibonacci's sequence is the list of numbers where the next number is a sum of the previous two.
/// Its first five elements are `1, 1, 2, 3, 5`.
pub fn fibonacci() -> Vec<u8> {
    const INITIAL_SIZE: usize = 2;
    make_fibonacci(5 - INITIAL_SIZE)
}

pub fn make_fibonacci(count: usize) -> Vec<u8> {
    let mut fibb = vec![1, 1];
    for _ in 0..count {
        let next = fibb[fibb.len() - 1] + fibb[fibb.len() - 2];
        fibb.push(next);
    }
    print!("{:?}", fibb);
    fibb
}
