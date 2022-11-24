#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    if inputs.is_empty() {
        return None;
    }

    let mut stack: Vec<i32> = Vec::new();
    for input in inputs {
        if let CalculatorInput::Value(number) = input {
            stack.push(*number)
        } else {
            if stack.len() < 2 {
                return None;
            }
            let op2 = stack.pop().unwrap();
            let op1 = stack.pop().unwrap();

            match input {
                CalculatorInput::Add => stack.push(op1 + op2),
                CalculatorInput::Subtract => stack.push(op1 - op2),
                CalculatorInput::Divide => stack.push(op1 / op2),
                CalculatorInput::Multiply => stack.push(op1 * op2),
                _ => return None,
            }
        }
    }

    if stack.len() != 1 {
        return None;
    }

    stack.pop()
}
