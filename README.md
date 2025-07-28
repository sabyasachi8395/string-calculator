# String Calculator – TDD Kata (Rails)

A simple string calculator implemented in Ruby on Rails, developed following **Test-Driven Development (TDD)** best practices.

![Ruby](https://img.shields.io/static/v1?label=Ruby&message=3.4.5.0&color=red&style=for-the-badge)
![Rails](https://img.shields.io/static/v1?label=Rails&message=8.0.2&color=9C312A&style=for-the-badge)
![Bundler](https://img.shields.io/static/v1?label=Bundler&message=2.6.9&color=f77b07&style=for-the-badge)
![RSpec](https://img.shields.io/static/v1?label=RSpec&message=8.0.1&color=2f5d8d&style=for-the-badge)

---

## 🚀 Getting Started

Follow the steps below to set up the project locally:

1. **Clone the repository**
   ```bash
   git clone "https://github.com/sabyasachi8395/string-calculator.git"
   cd string-calculator
   ```

2. **Install Ruby 3.4.5 using RVM**
   ```bash
   rvm install 3.4.5
   rvm use 3.4.5
   ```

3. **Install project dependencies**
   ```bash
   bundle install
   ```

---

## 🧮 Using the String Calculator

1. Start the Rails console:
   ```bash
   rails c
   ```

2. Use the `Calculator.add` method:
   ```ruby
   Calculator.add("1,3,5")  # => 9
   ```

---

## ✅ Running the Test Suite

This project uses **RSpec** for unit testing.

To run the tests:

```bash
rspec spec/calculator_spec.rb
```

---

## ⚙️ Implementation Details

- The core logic is implemented in a class named `Calculator` located in the `lib` directory.
- The main method is:
  ```ruby
  Calculator.add(input_string)
  ```
  - It handles addition operations on input strings using various delimiters.
  - Built incrementally using TDD, starting from basic cases and progressing to complex scenarios.

---

## 📌 Notes

- All features and edge cases are covered with unit tests.
- The project demonstrates clean design and TDD best practices with a focus on readability and maintainability.
