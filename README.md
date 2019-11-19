# bank-tech-test

## Summary
Bank-tech-test is a command line application that records transactions from a bank
account.  The application records and shows bank transaction on a statment so that
the user can keep track of their daily spending.  

## Installation
- Fork and clone this repo
- Run bundle install (to install gems)
- Run 'irb' in the command line to start the REPL
- Enter `./lib/account` into `irb` (this author assumes that you are in the
  project root)
- Run commands to create a new account, make deposits, make withdrawals and view your   statement

## Acceptance Criteria
- Read above (* Installation) for setup instuctions
- Run the following commands:

```
account = Account.new
account.deposit("10-01-2012", 1000)
account.deposit("13-01-2012", 2000)
account.withdrawal("14-01-2012", 500)
account.view_statement
```

> date || credit || debit || balance
>
> 14-01-2012 ||  || 500.00 || 2500.00
>
> 13-01-2012 || 2000.00 ||  || 3000.00
>
> 10-01-2012 || 1000.00 ||  || 1000.00

## Code Decisions
- The code is separated into three classes (account, statement and transaction)
to abide by OO principles.  I have tried to keep the classes loosely coupled to
increase maintainability of the code.  Transaction class' main role is to hold
just its own state.  Account holds an array of transaction objects which are
read by statement class to create a statment.

- I have failed to keep the statement class independent as its dependencies
need to understand several specific messages (i.e. date, credit, debit, balance) making this a less maintainable class.  If I had more time I would reassess the construction of statement.

## Gems/dependencies
- RSpec has been used for unit tests
- SimpleCov has been for test coverage
- Rubocop has been used to check code quality

## Testing
- The application has 14 unit tests
- There is a test coverage of 98%
- The unit tests have been isolated from dependencies using doubles and stubs
- Tests have been designed to test behaviour instead of state as much as possible
- If I had more time I would test for more edge cases as these still exist
