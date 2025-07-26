# String Calculator TDD Kata

A simple string calculator using Rails. Developed using the best practices for TDD.

![Ruby](https://img.shields.io/static/v1?label=Ruby&message=3.4.5.0&color=red&&style=for-the-badge)
![Rails](https://img.shields.io/static/v1?label=Rails&message=8.0.2&color=9C312A&&style=for-the-badge)
![Bundler](https://img.shields.io/static/v1?label=Bundler&message=2.6.9&color=f77b07&&style=for-the-badge)
![RSpec](https://img.shields.io/static/v1?label=RSpec&message=8.0.1&color=2f5d8d&&style=for-the-badge)

## Setting up

1. Clone the repository.
2. Install Ruby 3.4.5 using RVM.
3. Run `bundle install` to install the gem.
4. You are good to go.

## How to run the string calculator

1. Open rails console using `rails c`
2. Call the `add` method of the `Calculator` class like below:
  ```bash
  Calculator.add("1,3,5")
  ```

## How to execute the test cases:

1. The application is built with following TDD best practices, and used RSpec for the unit test cases.
2. To run the rspecs use the below command from the project root.

```bash
  rspec spec/calculator_spec.rb
```

## Implementation Logic:

1. A class was added under the lib folder named `calculator.rb` and the class name is `Calculator`.
2. A class method named `add` was also added in the `Calculator` class. This is mainly responsible for hadling all types of additions on the inputted string.