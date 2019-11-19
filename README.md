# bank-tech-test

## Summary
Bank-tech-test is a command line application that records transactions from a bank
account.  The application records and shows bank transaction on a statment so that
the user can keep track of their daily spending.  

## Installation
- Fork and clone this repo
- Run bundle install (to install gems)
- Run 'irb' in the command line to start the REPL
- Enter './lib/account' into 'irb' (this author assumes that you are in the
  project root)
- Run commands to create a new account, make deposits, make withdrawals and view your   statement

## Acceptance Criteria
- Read above (* Installation) for setup instuctions
- Run the following commands:
> `account = Account.new`
>
>  `account.deposit("10-01-2012", 1000)`
>
>  `account.deposit("13-01-2012", 2000)`
>
>  `account.withdrawal("14-01-2012", 500)`
>
>  `account.view_statement`

> date || credit || debit || balance
>
> 14-01-2012 ||  || 500.00 || 2500.00
>
> 13-01-2012 || 2000.00 ||  || 3000.00
>
> 10-01-2012 || 1000.00 ||  || 1000.00
