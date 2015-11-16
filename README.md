# LendMe

LendMe is a command line tool that allows prospective borrowers to
obtain a quote from a pool of lenders for 36 month loans.

The pool of lenders is initialized via csv file containing the name of
the lender, its rate and amount available to lend.

The tool strives to provide as low a rate to the borrower as is possible to be
competitive.

Borrowers can request a loan of any £100 increment between £1000
and £15000 inclusive. If the market does not have sufficient offers from
lenders to satisfy the loan then the tool will inform is not possible to
provide a quote at that time.

## Installation

    $ git clone https://github.com/pedrocunha/lend_me.git
    $ cd lend_me
    $ bundle
    $ bundle exec rake install

## Usage

  ```
  Usage: lend_me [options]
      -m, --market PATH_TO_MARKET_CSV
      -a, --amount AMOUNT              Amount to loan
      -h, --help                       Show this message
      -v, --version                    Show version
  ```

Example:
  ```
  $ lend_me -m spec/fixtures/market.csv -a 1000
  Requested amount: £1000
  Rate: £-
  Monthly repayment: £30.88
  Total repayment: £1111.68
  ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pedrocunha/lend_me. This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

